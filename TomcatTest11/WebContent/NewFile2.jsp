<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.io.OutputStreamWriter"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<!-- import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Map;
 -->



<%

     class WordTest4 {
    public Map<String,Integer> map1=new HashMap<String,Integer>();
    void main(String arg[]) {
        String sz[];
        Integer num[];
        final int MAXNUM=1000; 
        
        
        sz=new String[MAXNUM+1];
        num=new Integer[MAXNUM+1];
        WordTest4 pipei=new WordTest4();
        int account =1;
        //Vector<String> ve1=new Vector<String>();
        try {
            pipei.daoru();
        } catch (IOException e) {

            e.printStackTrace();
        }

        int g_run=0;

        for(g_run=0;g_run<MAXNUM+1;g_run++)
        {
            account=1;
            for(Map.Entry<String,Integer> it : pipei.map1.entrySet())
            {
                if(account==1)
                {
                    sz[g_run]=it.getKey();
                    num[g_run]=it.getValue();
                    account=2;
                }
                if(account==0)
                {
                    account=1;
                    continue;
                }
                if(num[g_run]<it.getValue())
                {
                    sz[g_run]=it.getKey();
                    num[g_run]=it.getValue();
                }
            }
            pipei.map1.remove(sz[g_run]);
        }
        String tx1=new String();
        for(int i=0;i<g_run;i++)
        {
            if(sz[i]==null)
                continue;
            if(sz[i].equals(""))
                continue;
            tx1+=sz[i]+"\t "+num[i]+"\n";
            System.out.println(sz[i]+"\t "+num[i]);
        }
        try {
            pipei.daochu(tx1);
        } catch (IOException e) {

            e.printStackTrace();
        }      
    }
    public void daoru() throws IOException
    {
        
        File a=new File("d:/WordTest/test.txt");
        FileInputStream b = new FileInputStream(a);
        InputStreamReader c=new InputStreamReader(b,"UTF-8");
        String string2=new String();
        while(c.ready())
        {
            char string1=(char) c.read();
            if(!isWord(string1))
            {
                if(map1.containsKey(string2))
                {
                    Integer num1=map1.get(string2)+1;
                    map1.put(string2,num1);
                }
                else
                {
                    Integer num1=1;
                    map1.put(string2,num1);
                }
                string2="";
            }
            else
            {
                string2+=string1;
            }
        }
        if(!string2.isEmpty())
        {
            if(map1.containsKey(string2))
            {
                Integer num1=map1.get(string2)+1;
                map1.put(string2,num1);
            }
            else
            {
                Integer num1=1;
                map1.put(string2,num1);
            }
            string2="";
        }
        c.close();
        b.close();
    }
    public void daochu(String txt) throws IOException
    {
        File fi=new File("d:/WordTest/tongji.txt");
        FileOutputStream fop=new FileOutputStream(fi);
        OutputStreamWriter ops=new OutputStreamWriter(fop,"UTF-8");
        ops.append(txt);
        ops.close();
        fop.close();
    }
    public boolean isWord(char a)
    {
        if(a<='z'&&a>='a'||a<='Z'&&a>='A')
            return true;
        return false;
    }
    
}
%>