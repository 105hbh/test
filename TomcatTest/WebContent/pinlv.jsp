<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head> 
</head>
<body>
<a href="./test.jsp"><input name="主页面" type="button" id="btn3" title="主页面" value="前往主页面" /></a>
<p>
</p>
<form>
<table border='1' style="border-collapse: collapse;">
<tr>
	<th>单词</th>
	<th>当前频率</th>
	<th>历史频率</th>
</tr>
<%
List<List<String>> list1=(List<List<String>>)request.getAttribute("list1");
for(int i=0 ; i<list1.size() ; i++) {
    for(int j=0 ; j<list1.get(i).size() ; j++) {
    	String s=
    			list1.get(i).get(j);
%>
        <td><%=s %></td>
<%    
    }
}
%>
</table>
<p><input type="button" value="按频率排序"></p>
</form>
</body>
</html>