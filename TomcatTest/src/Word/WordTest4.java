package Word;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WordTest4 {
	public String content;
	public Map<String ,Integer> map = new HashMap<String, Integer>();
	public WordTest4(String content)	{
		this.content=content;
		jiansuo();
	}
	
	public Map<String ,Integer> getMap() {
		return map;
	}
	
	public void jiansuo()
	{		
		try {
			String str = content.toString().toLowerCase(); // 将stringBuffer转为字符并转换为小写
		 
		     String[] words = str.split("[^(a-zA-Z)]+");  // 非单词的字符来分割，得到所有单词
		     for(String word :words)
		     {
		    	 if(map.get(word)==null)
		    	 {  // 若不存在说明是第一次，则加入到map,出现次数为1
		             map.put(word,1);
		         }
		    	 else
		    	 {
		             map.put(word,map.get(word)+1);  // 若存在，次数累加1 
		    	 } 
		     }
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
	}

}
