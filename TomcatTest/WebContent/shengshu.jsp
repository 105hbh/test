<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
</head>
<body>
<a href="./test.jsp"><input name="主页面" type="button" id="btn4" title="主页面" value="前往主页面" /></a>
<p>
</p>
<form>
<p>
生疏度
0<input type="radio" checked="checked" name="生疏度" value="0" />
1<input type="radio" name="生疏度"  value="1" />
2<input type="radio" name="生疏度"  value="2" />
3<input type="radio" name="生疏度"  value="3" />
</p>
<table border='1' style="border-collapse: collapse;">
<tr>
	<th>单词</th>
	<th>生疏度</th>
</tr>
<tr>
	<td></td>
	<td>
	<select name="生疏度">
	<option value="0">0</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	</select>
	</td>
</tr>
</table>
</form>
</body>
</html>