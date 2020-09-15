<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<script type="text/javascript">
List all = null;
all = (List)session.getAttrube("list");
if( all==null ){
	//所以第一次运行时 all一定会是null
	//那就实例化 all
	all = new ArrayList();
	}
String str[] = request.getParmeterValue("caipiao");
all.add(str);
session.setAttrbute("list",all);
</script>
</body>
</html>