package com.perk.livetv.aphone.utils;

import android.graphics;

public class GifAnimationDrawable extends android.graphics.drawable.AnimationDrawable {
	private boolean decoded;
	private int height;
	private Runnable loader;
	private GifDecoder mGifDecoder;
	private Bitmap mTmpBitmap;
	private int width;

	static /* synthetic */ GifDecoder access$0 (GifAnimationDrawable param1){
		return null;
	}
	static /* synthetic */ void access$1 (GifAnimationDrawable param1, Bitmap param2){
		return;
	}
	static /* synthetic */ Bitmap access$2 (GifAnimationDrawable param1){
		return null;
	}
	static /* synthetic */ void access$3 (GifAnimationDrawable param1, boolean param2){
		return;
	}
	static /* synthetic */ void access$4 (GifAnimationDrawable param1, GifDecoder param2){
		return;
	}
	public int getIntrinsicHeight (){
		return 0;
	}
	public int getIntrinsicWidth (){
		return 0;
	}
	public int getMinimumHeight (){
		return 0;
	}
	public int getMinimumWidth (){
		return 0;
	}
	public boolean isDecoded (){
		return false;
	}
}