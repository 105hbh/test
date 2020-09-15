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
			String str = content.toString().toLowerCase(); // ��stringBufferתΪ�ַ���ת��ΪСд
		 
		     String[] words = str.split("[^(a-zA-Z)]+");  // �ǵ��ʵ��ַ����ָ�õ����е���
		     for(String word :words)
		     {
		    	 if(map.get(word)==null)
		    	 {  // ��������˵���ǵ�һ�Σ�����뵽map,���ִ���Ϊ1
		             map.put(word,1);
		         }
		    	 else
		    	 {
		             map.put(word,map.get(word)+1);  // �����ڣ������ۼ�1 
		    	 } 
		     }
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
	}

}
