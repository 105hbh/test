<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="org.sqlite.JDBC"%>
<%-- <%@ page language="java" import="qwq.WordTest4" pageEncoding="utf-8"%> --%>
<title>WordFriend-your friend for word</title>

<h2>当前文章界面</h2>
<% 
	String content = request.getParameter("content");
	if (content != null) {
		out.println(content);
	} else {
		out.println("<p>请输入英文文章后，点击确认按钮。</p>");
	}

%>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- <script>$(function(){
    $("input").textboxHint({
        focc : "#f00",
        txt : "请输入文章"
    });
});
</script>

<input type="text" value="请输入地址" />
<script>$(function(){
    
    var n = $('#name');
    n.val('请输入姓名');
    n.focus(function(){
        $(this).val('');
    }).blur(function(){
        $(this).val('请输入姓名');
    })
 
});</script> -->

<!-- <script>
/***
 * Copyright (c) 2015 http://www.cnblogs.com/cymmint/
 * Ver: textboxHint() 0.1
 * Date: 2015-01-07
 * Author: cymmint
 * Function: 文本框默认值提示文件设置
 */
(function($){
    $.fn.textboxHint = function(opts){
        var defaults = {
            txt  : "",
            defc : "#999",
            focc : "#333"
        }
        
        var opts = $.extend(defaults, opts);
        
        return this.each(function(){
            var self = $(this),
                txt  = opts.txt != "" ? opts.txt : self.val();

            self.val(txt).css("color", opts.defc);
            self.on("focus", function(){
                if(self.val() == "" || self.val() == txt) {
                    self.val("");
                }
                self.css("color", opts.focc);
            });
            self.on("blur", function(){
                if(self.val() == "" || self.val() == txt) {
                    self.val(txt).css("color", opts.defc);
                }
            });
        });
    }
})(jQuery);
</script> -->

<%
Class.forName("org.sqlite.JDBC");
Connection conn = DriverManager.getConnection("jdbc:sqlite:test");//filename为你的SQLite数据名称     // ... use the database ...     
conn.close();
%>>

<form method="post" action="./display">
	<%-- <%for(int i=0;i<40;i++){%><tr><td>&nbsp;</td><%}%> --%>
	<textarea name="content" rows="15" cols="79" onfocus="this.value='';">输入文章 ...</textarea>
	<!-- <input type="text" value="请输入姓名" onfocus="this.value='';"/> -->
	<br/>
	<br>
	<%for(int i=0;i<89;i++){%><tr><td>&nbsp;</td><%}%>
	<input type="submit" name="confirmation" value="生成当前文章的单词频率" />
	<input type="reset" name="clear-button" value="Clear content" />
</form>

<table id="q" border="1" width="590">
<tr>
  <th>单词</th>
  <th>频率</th>
  <th>生疏度</th>
  <th> </th>
</tr>
<tr>
  <td>Bill Gates</td>
  <td>555 77 854</td>
  <td>555 77 855</td>
  <td>wqw</td>
</tr>
</table>

<head>
<script>
function insRow(id) {
  var x = document.getElementById(id).insertRow(1);
  var y = x.insertCell(0);
  var z = x.insertCell(1);
  var a = x.insertCell(2);
  var b = x.insertCell(3);
  /* a.innerHTML = "<s:textfield name = "q" label="22222" ></s:textfield>"; */
  b.innerHTML = a.innerHTML = y.innerHTML = z.innerHTML = "New";
}

</script>

<p>
<input type="button" onclick="insRow('q')" value="插入行">
</p>
<br>
<input type="submit" name="confirmation" value="    确认     " />
	<%for(int i=0;i<35;i++){%><tr><td>&nbsp;</td><%}%>

<script>var $targetTbody= $("#batchPlanTable tbody");
var $tr = $targetTbody.children("tr[name='res']:last");
$tr.after($tr[0].outerHTML);
</script>
<!-- <table>
 <tr>
     <td>第一行</td>
        <td>
         <ol>
             <li>1</li>
            </ol>
        </td>
    </tr>
</table>
<button id="btn3">追加</button>
<button id="btn4">减少</button>

<script type="text/javascript">
 $(document).ready(function(){
  $("#btn3").click(function(){
   var len=$("table tr").length;
   $("table").append("<tr id="+len+">"+"<td>"+len+"</td></tr>");
   });
   
 $("#btn4").click(function(){
  var len=$("table tr").length;
  if(len>1){
     $("tr[id='"+(len-1)+"']").remove(); 
   }
  
  });
   
  });
</script> -->
<%
//筛选
%>>


<a href="./pinlv.jsp">前往频率表</a>
<%for(int i=0;i<25;i++){%><tr><td>&nbsp;</td><%}%>
<a href="./ssd.jsp">前往生疏度表</a>
<p>今天的日期是: 
<%= (new java.util.Date()).toLocaleString()%>

</p>