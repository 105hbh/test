<%@ page contentType="text/html"%>  
<%@page pageEncoding="GB2312"%>  
<%@page import="java.sql.*" %>  <%--����java.sql��--%>
<html>
<head>
<title >����ͳ��</title>
</head>
<body style="background:url(http://www.pptbz.com/pptpic/UploadFiles_6909/201105/2011051707485717.jpg) center;background-size:cover">
<%  
        try {  
            Class.forName("com.mysql.jdbc.Driver");  ����������
            String url = "jdbc:mysql://localhost:3306/study" ; //���ݿ���
            String username = "root";  //���ݿ��û���
            String password = "123456";  //���ݿ��û�����
            Connection conn = DriverManager.getConnection(url, username, password);  //����״̬
            if(conn != null){  
                out.print("���ݿ����ӳɹ���");  %>
<h2>A��Z��ͷ���ʸ����ֱ�Ϊ��</h2>
<table align="center" border="1">
<tr>
<td width="55" initial="title">����ĸ</td>
<td width="55" count(initial)="title">ͳ��</td>

</tr>
<%
                Statement stmt = null;  
                ResultSet rs = null; 
                String sql = "SELECT initial,count(initial) FROM word GROUP BY initial;";  //��ѯ���
                stmt = conn.createStatement();  
                rs = stmt.executeQuery(sql);  
                while (rs.next()) {%>	

<tr>
<td width="55"><%=rs.getString("initial") %></td>
<td width="55"><%=rs.getString("count(initial)") %></td> 
</tr>

          <%} 
            }else{  
                out.print("����ʧ�ܣ�");  
            }  
        }catch (Exception e) {        
            e.printStackTrace();  
            out.print("���ݿ������쳣��");  
        }  
%> 
</table>
<h1 align="center" ><input type="button" name="Submit" onclick="javascript:history.back(-1);" value="������һҳ"> </h1><%--���÷��ذ�ť--%>
</body>
</html>
