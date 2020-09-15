<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 13-10-9
  Time: 上午11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        function creatTable(){
            var div = document.getElementById("resultDiv");
            div.innerHTML = "";
            var row = document.getElementById("row").value;
            var col = document.getElementById("col").value;


            var table = document.createElement("table");
            table.setAttribute("border","1");
            table.setAttribute("width","100%");
            var tbody = document.createElement("tbody");
            table.appendChild(tbody);

            for(var i= 0 ;i<parseInt(row) ; i++){
                var tr = document.createElement("tr");
                for(var j =0 ; j<parseInt(col);j++){
                    var td = document.createElement("td");
                    td.innerHTML =  j +'';
                    tr.appendChild(td);
                }
                tbody.appendChild(tr);
            }

            div.appendChild(table);
        }
    </script>
</head>
<body>
  <table border="1">
      <tr>
          <td style="width: 100px;height: 40px;">行：</td>
          <td><input  id="row" type="text"/></td>

      </tr>
      <tr>
          <td>列：</td>
          <td><input id="col" type="text"/> </td>
      </tr>

      <tr><td colspan="2"> <input type="button" value="提交" onclick="creatTable()"/> </td></tr>
  </table>

   <div id="resultDiv">

   </div>
</body>
</html>