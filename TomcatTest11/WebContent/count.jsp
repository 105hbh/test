<%@ page contentType="text/html"%>  
<%@page pageEncoding="GB2312"%>  
<%@page import="java.sql.*" %>  <%--导入java.sql包--%>
<html>
<head>
<title >单词统计</title>
</head>
<body style="background:url(http://www.pptbz.com/pptpic/UploadFiles_6909/201105/2011051707485717.jpg) center;background-size:cover">
<%  
        try {  
            Class.forName("com.mysql.jdbc.Driver");  驱动程序名
            String url = "jdbc:mysql://localhost:3306/study" ; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
            if(conn != null){  
                out.print("数据库连接成功！");  %>
<h2>A至Z开头单词个数分别为：</h2>
<table align="center" border="1">
<tr>
<td width="55" initial="title">首字母</td>
<td width="55" count(initial)="title">统计</td>

</tr>
<%
                Statement stmt = null;  
                ResultSet rs = null; 
                String sql = "SELECT initial,count(initial) FROM word GROUP BY initial;";  //查询语句
                stmt = conn.createStatement();  
                rs = stmt.executeQuery(sql);  
                while (rs.next()) {%>	

<tr>
<td width="55"><%=rs.getString("initial") %></td>
<td width="55"><%=rs.getString("count(initial)") %></td> 
</tr>

          <%} 
            }else{  
                out.print("连接失败！");  
            }  
        }catch (Exception e) {        
            e.printStackTrace();  
            out.print("数据库连接异常！");  
        }  
%> 
</table>
<h1 align="center" ><input type="button" name="Submit" onclick="javascript:history.back(-1);" value="返回上一页"> </h1><%--设置返回按钮--%>
</body>
</html>
