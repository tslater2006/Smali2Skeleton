using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using NUnit.Framework;
using System.Text.RegularExpressions;
namespace Smali2Skeleton.Tests
{
    [TestFixture]
    public class ParserTests
    {
        [Test]
        public void TestClassParse()
        {
            String smaliText = File.ReadAllText("Tests\\Files\\Utility.smali");
            SmaliFile file = new SmaliFile(smaliText);

            Assert.AreEqual("Utils", file.ClassName);
            Assert.AreEqual("com.perk.livetv.aphone.utils", file.Package);
            Assert.AreEqual("public", file.Modifiers);

            Assert.AreEqual("Object", file.SuperClass);

            
            
        }

        [Test]
        public void TestFieldParse()
        {
            String smaliText = File.ReadAllText("Tests\\Files\\Utility.smali");
            SmaliFile file = new SmaliFile(smaliText);

            Assert.AreEqual(7, file.Fields.Count);

            Assert.AreEqual("private static final String[] HOSTS_FILES;", file.Fields[0].ToString());
        }

        [Test]
        public void TestMethodParse()
        {
            String smaliText = File.ReadAllText("Tests\\Files\\GifAnimationDrawable.smali");
            SmaliFile file = new SmaliFile(smaliText);

            File.WriteAllText("Tests\\Results\\GifAnimationDrawable.java", file.ToString());

            //Assert.AreEqual(17, file.Methods.Count);
        }

        [Test]
        public void TestSkeletonGeneration()
        {
            String smaliText = File.ReadAllText("Tests\\Files\\GifAnimationDrawable.smali");
            SmaliFile file = new SmaliFile(smaliText);

            File.WriteAllText("Tests\\Results\\GifAnimationDrawable.java", file.ToString());

            smaliText = File.ReadAllText("Tests\\Files\\Utility.smali");
            file = new SmaliFile(smaliText);

            File.WriteAllText("Tests\\Results\\Utility.java", file.ToString());

            //Assert.AreEqual(17, file.Methods.Count);
        }
    }
}
