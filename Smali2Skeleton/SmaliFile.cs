using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Text.RegularExpressions;
namespace Smali2Skeleton
{
    public class SmaliFile
    {
        public string Modifiers;
        public string Package;
        public string ClassName;
        public string SuperClass;
        public HashSet<String> Imports = new HashSet<string>();
        public List<SmaliField> Fields = new List<SmaliField>();
        public List<SmaliMethod> Methods = new List<SmaliMethod>();
        public List<SmaliConstructor> Constructors = new List<SmaliConstructor>();
        private string SmaliText;
        public SmaliFile(String smaliText)
        {
            SmaliText = smaliText;
            /* detect the class/package */
            Regex classRegex = new Regex(".class (?<modifiers>.*?) L(?<fullClass>.*?);");
            Modifiers = classRegex.Match(SmaliText).Groups["modifiers"].Value.Trim();
            string fullClass = classRegex.Match(SmaliText).Groups["fullClass"].Value.Trim();

            ClassName = fullClass.Substring(fullClass.LastIndexOf("/") + 1);
            Package = fullClass.Substring(0, fullClass.LastIndexOf("/")).Replace("/", ".");

            /* detect super class */
            Regex superRegex = new Regex(".super (?<super>L.*?);");
            SuperClass = superRegex.Match(SmaliText).Groups["super"].Value;
            DecodeType(ref SuperClass);

            ParseFields();
            ParseMethods();
            ParseConstructors();
            ProcessImports();
        }

        private void ProcessImports()
        {
            /* process fields */
            foreach (SmaliField f in Fields)
            {
                if (f.Type.Contains("."))
                {
                    /* this item seems to be a packaged object, lets extract package name :) */
                    string package = f.Type.Substring(0, f.Type.LastIndexOf("."));
                    f.Type = f.Type.Replace(package + ".", "");
                    if (package.Equals(this.Package) == false)
                    {
                        Imports.Add(package);
                    }
                    
                }
            }
            /* process constructors */
            foreach (SmaliConstructor m in Constructors)
            {
                /* process parameters */
                foreach (SmaliParameter p in m.Parameters)
                {
                    if (p.Type.Contains("."))
                    {
                        /* this item seems to be a packaged object, lets extract package name :) */
                        string package = p.Type.Substring(0, p.Type.LastIndexOf("."));
                        p.Type = p.Type.Replace(package + ".", "");
                        if (package.Equals(this.Package) == false)
                        {
                            Imports.Add(package);
                        }
                    }
                }
            }
            /* process methods */
            foreach (SmaliMethod m in Methods)
            {
                /* process parameters */
                foreach (SmaliParameter p in m.Parameters)
                {
                    if (p.Type.Contains("."))
                    {
                        /* this item seems to be a packaged object, lets extract package name :) */
                        string package = p.Type.Substring(0, p.Type.LastIndexOf("."));
                        p.Type = p.Type.Replace(package + ".", "");
                        if (package.Equals(this.Package) == false)
                        {
                            Imports.Add(package);
                        }
                    }
                }

                /* process return type */
                if (m.ReturnType.Contains("."))
                {
                    /* this item seems to be a packaged object, lets extract package name :) */
                    string package = m.ReturnType.Substring(0, m.ReturnType.LastIndexOf("."));
                    m.ReturnType = m.ReturnType.Replace(package + ".", "");
                    if (package.Equals(this.Package) == false)
                    {
                        Imports.Add(package);
                    }
                }
            }

        }

        private void ParseFields()
        {
            Regex fieldRegex = new Regex(".field (?<modifiers>.*?) (?<fieldName>[a-zA-Z0-9_$]+):(?<type>.*?)[;|= |\\s]\\s?(?<init>(.*))");
            var collection = fieldRegex.Matches(SmaliText);
            foreach (Match m in collection) {
                SmaliField field = new SmaliField();
                field.Modifiers = m.Groups["modifiers"].Value.Trim();
                field.FieldName = m.Groups["fieldName"].Value.Trim();
                field.Type = m.Groups["type"].Value.Trim();
                DecodeType(ref field.Type);
                
                field.Init = m.Groups["init"].Value.Trim();

                this.Fields.Add(field);
            }
        }
        private void ParseMethods()
        {
            Regex methodRegex = new Regex(".method\\ (?<modifiers>.*)\\ (?<name>[a-zA-Z0-9$_]*)\\((?<params>.*)\\)(?<return>.*)");
            var collection = methodRegex.Matches(SmaliText);
            foreach (Match m in collection) {
                SmaliMethod method = new SmaliMethod();
                method.Modifiers = m.Groups["modifiers"].Value.Trim().Replace("synthetic","/* synthetic */");
                method.ReturnType = m.Groups["return"].Value.Trim();
                DecodeType(ref method.ReturnType);
                string paramString = m.Groups["params"].Value.Trim();
                method.MethodName = m.Groups["name"].Value.Trim();
                Regex paramSplit = new Regex("([ZBSCIJFD]|\\[[ZBSCIJFD]|L.*?;|\\[L.*?;)");
                string[] parms = paramSplit.Split(paramString).Where(s => s != String.Empty).ToArray();
                for (var x = 0; x < parms.Length; x++)
                {
                    DecodeType(ref parms[x]);
                }
                
                /* lets find the ".end-method" and then extract this string to pull out the .params */

                int endMethodLocation = SmaliText.IndexOf(".end method", m.Index);
                string methodText = SmaliText.Substring(m.Index, endMethodLocation - m.Index);

                Regex paramRegex = new Regex(".param.*?,\\ \"(?<paramName>.*?)\"");
                var paramMatches = paramRegex.Matches(methodText);
                List<string> paramNames = new List<string>();

                foreach (Match p in paramMatches)
                {
                    paramNames.Add(p.Groups["paramName"].Value.Trim());
                }
                
                for (var x = 0; x < parms.Length; x++)
                {
                    SmaliParameter param = new SmaliParameter();
                    if (x >= paramNames.Count)
                    {
                        param.Name = "param" + (x + 1);
                    }
                    else
                    {
                        param.Name = paramNames[x];
                    }
                    param.Type = parms[x];
                    method.Parameters.Add(param);
                }
                Methods.Add(method);
            }
        }

        private void ParseConstructors()
        {
            Regex methodRegex = new Regex(".method (?<modifiers>.*?)\\ constructor.*?\\((?<params>.*)\\)V");
            var collection = methodRegex.Matches(SmaliText);
            foreach (Match m in collection)
            {
                SmaliConstructor constructor = new SmaliConstructor();
                constructor.Modifiers = m.Groups["modifiers"].Value.Trim().Replace("synthetic", "/* synthetic */");
                if (constructor.Modifiers.Contains("static"))
                {
                    continue;
                }
                constructor.ClassName = this.ClassName;
                string paramString = m.Groups["params"].Value.Trim();
                Regex paramSplit = new Regex("([ZBSCIJFD]|\\[[ZBSCIJFD]|L.*?;|\\[L.*?;)");
                string[] parms = paramSplit.Split(paramString).Where(s => s != String.Empty).ToArray();
                for (var x = 0; x < parms.Length; x++)
                {
                    DecodeType(ref parms[x]);
                }

                int endMethodLocation = SmaliText.IndexOf(".end method", m.Index);
                string methodText = SmaliText.Substring(m.Index, endMethodLocation - m.Index);

                Regex paramRegex = new Regex(".param.*?,\\ \"(?<paramName>.*?)\"");
                var paramMatches = paramRegex.Matches(methodText);
                List<string> paramNames = new List<string>();

                foreach (Match p in paramMatches)
                {
                    paramNames.Add(p.Groups["paramName"].Value.Trim());
                }

                for (var x = 0; x < parms.Length; x++)
                {
                    SmaliParameter param = new SmaliParameter();
                    if (x >= paramNames.Count)
                    {
                        param.Name = "param" + (x + 1);
                    }
                    else
                    {
                        param.Name = paramNames[x];
                    }
                    param.Type = parms[x];
                    constructor.Parameters.Add(param);
                }
                Constructors.Add(constructor);

            }
        }

        private static void DecodeType(ref string type)
        {
            if (type.Length == 0) { return; }
            switch (type[0])
            {
                case 'L':
                    // object type
                    type = type.Substring(1).Replace("/",".");
                    /* remove always available packages like java.lang */
                    if (type.StartsWith("java.lang."))
                    {
                        type = type.Substring("java.lang.".Length);
                    }

                    if (type.EndsWith(";")) {
                        type = type.Substring(0,type.Length - 1);
                    }
                    break;
                case 'Z':
                    type = "boolean";
                    break;
                case 'V':
                    type = "void";
                    break;
                case 'B':
                    type = "byte";
                    break;
                case 'S':
                    type = "short";
                    break;
                case 'C':
                    type = "char";
                    break;
                case 'I':
                    type = "int";
                    break;
                case 'J':
                    type = "long";
                    break;
                case 'F':
                    type = "float";
                    break;
                case 'D':
                    type = "double";
                    break;
                case '[':
                    string temp = type.Substring(1);
                    DecodeType(ref temp);
                    type = temp + "[]";
                    break;
            }
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            /* add the package */
            sb.Append("package ").Append(Package).Append(";\r\n\r\n");

            /* print imports */
            var importList = Imports.ToList();
            importList.Sort();
            foreach (string s in importList)
            {
                sb.Append("import ").Append(s).Append(";\r\n");
            }
            sb.Append("\r\n");
            /* class modifiers and name */
            sb.Append(Modifiers).Append(" class ").Append(ClassName);

            if (SuperClass.Equals("Object") == false)
            {
                /* add the super class */
                sb.Append(" extends ").Append(SuperClass);
            }

            /* open class */
            sb.Append(" {\r\n");

            /* write out the constructors */
            /* write out the methods */
            foreach (SmaliConstructor m in Constructors)
            {
                string methodText = m.ToString();
                string[] lines = methodText.Split(new string[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries);
                for (var x = 0; x < lines.Length; x++)
                {
                    sb.Append("\t").Append(lines[x]).Append("\r\n");
                }
            }


            /* write out the fields */
            foreach (SmaliField f in Fields)
            {
                sb.Append("\t").Append(f).Append("\r\n");
            }
            sb.Append("\r\n");

            /* write out the methods */
            foreach (SmaliMethod m in Methods)
            {
                string methodText = m.ToString();
                string[] lines = methodText.Split(new string[]{"\r\n"},StringSplitOptions.RemoveEmptyEntries);
                for (var x = 0; x < lines.Length; x++)
                {
                    sb.Append("\t").Append(lines[x]).Append("\r\n");
                }
            }

            /* close the class */

            sb.Append("}");

            return sb.ToString();
        }
    }

    public class SmaliField
    {
        public string Modifiers;
        public string Type;
        public string FieldName;
        public string Init;
        public bool isArray;

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(Modifiers).Append(" ");
            sb.Append(Type);
            if (isArray)
            {
                sb.Append("[]");
            }
            sb.Append(" ").Append(FieldName);
            if (Init.Length > 0)
            {
                sb.Append(" ").Append(Init);
            }

            return sb.Append(";").ToString();
        }
    }

    public class SmaliMethod
    {
        public string Modifiers;
        public string ReturnType;
        public string MethodName;
        public List<SmaliParameter> Parameters = new List<SmaliParameter>();

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(Modifiers).Append(" ").Append(ReturnType).Append(" ").Append(MethodName).Append(" (");
            for (var x = 0; x < Parameters.Count; x++)
            {
                sb.Append(Parameters[x]);
                if (x < Parameters.Count - 1)
                {
                    sb.Append(", ");
                }
            }
            sb.Append("){\r\n\t");
            string returnStatement = "";
            if (ReturnType.EndsWith("[]"))
            {
                returnStatement = "return null;";
            }
            else
            {
                switch (ReturnType)
                {
                    case "void":
                        returnStatement = "return;";
                        break;
                    case "boolean":
                        returnStatement = "return false;";
                        break;
                    case "int":
                    case "long":
                    case "double":
                    case "float":
                    case "short":
                        returnStatement = "return 0;";
                        break;
                    case "char":
                        returnStatement = "return (char)32;";
                        break;
                    case "byte":
                        returnStatement = "return (byte)0;";
                        break;
                    default:
                        returnStatement = "return null;";
                        break;
                }
            }
            sb.Append(returnStatement).Append("\r\n}");
            
            return sb.ToString();
        }
    }

    public class SmaliConstructor
    {
        public string ClassName;
        public string Modifiers;
        public List<SmaliParameter> Parameters = new List<SmaliParameter>();

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(Modifiers + " " + ClassName + "(");
            for (var x = 0; x < Parameters.Count; x++)
            {
                sb.Append(Parameters[x]);
                if (x < Parameters.Count - 1)
                {
                    sb.Append(", ");
                }
            }
            sb.Append(") { }");
            return sb.ToString();
        }
            
    }

    public class SmaliParameter
    {
        public string Type;
        public string Name;

        public override string ToString()
        {
            return Type + " " + Name;
        }
    }
}
