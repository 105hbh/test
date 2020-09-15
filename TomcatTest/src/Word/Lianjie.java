package Word;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class Lianjie {
	public static final String URL = "jdbc:mysql://localhost:3306/test";
    public static final String USER = "root";
    public static final String PASSWORD = "123"; 
    public static Lianjie lianjie=new Lianjie();
    private Lianjie(){
    	
    }
    public static Lianjie getInstance() {
    	return lianjie;
    }
    private Connection getConnection()
    {
    	Connection conn=null;
    	
    	try {
            Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(URL, USER, PASSWORD);
        	}
        	catch(Exception e){
        		e.printStackTrace();
        	}
    	return conn;
    }
    public void save(Map<String,Integer> map)
    {
    	for(Map.Entry<String, Integer> entry : map.entrySet()){
    		String word=entry.getKey();
    		int lishiWord=hasWord(word);
    		if(lishiWord==-1)
    		{
    			insertWord(entry.getKey(),entry.getValue());
    		}
    		else
    		{
    			updatePinlv(entry.getKey(),entry.getValue(),lishiWord);
    		}
    	}
    
    	
    }
    private int hasWord(String word)
    {
    	Connection conn=getConnection();
    	String sql = "select lishipinlv from wordfre where word='"+word+"'";
        PreparedStatement pstmt=null;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            int col = rs.getMetaData().getColumnCount();
            if(col==0)
            {
            	pstmt.close();
            	conn.close();
            	return -1;
            }
            rs.next();
            
            return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
        	try {
        		pstmt.close();
                conn.close();
        	}catch(Exception e) {
        		e.printStackTrace();
        	}
        	
        }
        return -1;  
    }
    private void insertWord(String word,int pinlv)
    {
    	Connection conn=getConnection();
        String sql = "insert into wordfre (word,dangqianpinlv,lishipinlv,shengshu) values(?,?,?,?)";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, word);
            pstmt.setInt(2,pinlv);
            pstmt.setInt(3, pinlv);
            pstmt.setInt(4, 0);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    private void updatePinlv(String word,int dangqianpinlv,int lishipinlv)
    {
    	 Connection conn=getConnection();
    	 String sql = "update wordfre set dangqianpinlv=" + dangqianpinlv + ",lishipinlv="+(lishipinlv+ dangqianpinlv)+" where word='" + word + "'";
    	    PreparedStatement pstmt;
    	    try {
    	        pstmt = (PreparedStatement) conn.prepareStatement(sql);
    	        pstmt.executeUpdate();
    	        pstmt.close();
    	        conn.close();
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    }
    public void selectPinlv(List<List<String>> list1)
    {
    	Connection conn=getConnection();
    	String sql = "select word,dangqianpinlv,lishipinlv from wordfre";
    	PreparedStatement pstmt=null;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            int col = rs.getMetaData().getColumnCount();
            if(col==0)
            {
            	pstmt.close();
            	conn.close();
            	return;
            }
         while(rs.next())
          {
        	  List<String> list=new ArrayList<String>();
          	  list1.add(list);
          	  for(int j=1;j<=3;j++)
          	  {
          		  list.add((String) rs.getObject(j));
          	  }
          }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
        	try {
        		pstmt.close();
                conn.close();
        	}catch(Exception e) {
        		e.printStackTrace();
        	}
        	
        }      
    }
}

