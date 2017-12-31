package com.lucifer.utils;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class WxPinYinHelper {

	private static HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
	
	static{
		defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
	}
	
	private static String getHanYuPinYin(char arg) throws BadHanyuPinyinOutputFormatCombination{
		String [] result = PinyinHelper.toHanyuPinyinStringArray(arg, defaultFormat);
		if (null == result || result.length == 0) {
			return String.valueOf(arg).toLowerCase();
		}else{
			return result[0];
		}
	}
	
	public static String getHanYuPinYin(String arg) throws BadHanyuPinyinOutputFormatCombination{
		if(null==arg){
			return null;
		}
		char[]  chars = arg.toCharArray();
		StringBuffer sb=new StringBuffer();
		for(char c:chars){
			String result = getHanYuPinYin(c);
			sb.append(result);
		}
		return sb.toString();
	}
	private static String getHanYuPinYinFirstChar(char arg) throws BadHanyuPinyinOutputFormatCombination{
		String [] result = PinyinHelper.toHanyuPinyinStringArray(arg, defaultFormat);
		if (null == result || result.length == 0) {
			return String.valueOf(arg).toLowerCase();
		}else{
			return result[0].substring(0,1);
		}
	}
	public static String getHanYuPinYinFirstChar(String arg) throws BadHanyuPinyinOutputFormatCombination{
		if(null==arg){
			return null;
		}
		char[]  chars = arg.toCharArray();
		StringBuffer sb=new StringBuffer();
		for(char c:chars){
			String result = getHanYuPinYinFirstChar(c);
			sb.append(result);
		}
		return sb.toString();
	}
}
