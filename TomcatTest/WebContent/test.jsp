<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Word.WordTest4,java.util.*" %>
	
<!DOCTYPE html>
<html>
<head> 
</head>
<body>
<form action="/TomcatTest/HelloServlet" method="post">
<p>请输入文本：</p>
<textarea name="content" rows="20" cols="120"></textarea>
<p><input type="submit" name= content value="筛选"></p>

</form>

<table border='1' style="border-collapse: collapse;">

<tr>
	<th>单词</th>
	<th>频率</th>
</tr>
<%
Map<String,Integer> map=(Map<String,Integer>)request.getSession().getAttribute("map");
if(map!=null)
for(Map.Entry<String, Integer> entry : map.entrySet()){
%>
<tr>
	<td><%=entry.getKey() %></td>
	<td><%=entry.getValue() %></td>
</tr>
<%
}
%>
</table>
<p>
<button onClick="window.location.href='/TomcatTest/WordServlet'">保存</button>
</p>
<form>
<p>
<a href="./pinlv.jsp"><input name="频率" type="button" id="btn12" title="频率表" value="前往生疏度表" /></a>
<a href="./shengshu.jsp"><input name="生疏度" type="button" id="btn2" title="生疏度表" value="前往生疏度表" /></a>
</p>
</form>
</body>
</html>