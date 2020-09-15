<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%> 

<script>
 function sort(tableId, sortColumn,nodeType) {  
    var table = document.getElementById("theTable");  
    var tableBody = table.tBodies[0];  
    var tableRows = tableBody.rows;  
      
      
    var rowArray = new Array();  
    for (var i = 0; i < tableRows.length; i++) {  
        rowArray[i] = tableRows[i];  
    }  
    if (table.sortColumn == sortColumn) {  
        rowArray.reverse();  
    } else {  
        rowArray.sort(generateCompareTR(sortColumn, nodeType));  
    }  
    var tbodyFragment = document.createDocumentFragment();  
    for (var i = 0; i < rowArray.length; i++) {  
        tbodyFragment.appendChild(rowArray[i]);  
    }  
    tableBody.appendChild(tbodyFragment);  
    table.sortColumn = sortColumn;  
}  
 
 
function generateCompareTR(sortColumn, nodeType) {  
    return function compareTR(trLeft, trRight) {  
        var leftValue = convert(trLeft.cells[sortColumn].firstChild.nodeValue, nodeType);  
        var rightValue = convert(trRight.cells[sortColumn].firstChild.nodeValue, nodeType);  
        if (leftValue < rightValue) {  
            return -1;  
        } else {  
            if (leftValue > rightValue) {  
                return 1;  
            } else {  
                return 0;  
            }  
        }  
    };  
}  
 
 
function convert(value, dataType) {  
    switch (dataType) {  
      case "int":  
        return parseInt(value);  
      case "float":  
        return parseFloat(value);  
      case "date":  
        return new Date(Date.parse(value));  
      default:  
        return value.toString();  
    }  
}
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 

        <base href="<%=basePath%>"> 
 
        <title>My JSP 'tabel.jsp' starting page</title> 
 
        <meta http-equiv="pragma" content="no-cache"> 
        <meta http-equiv="cache-control" content="no-cache"> 
        <meta http-equiv="expires" content="0"> 
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"> 
        <meta http-equiv="description" content="This is my page"> 
        <!-- 
    <link rel="stylesheet" type="text/css" href="styles.css"> 
    --> 
        <script type="text/javascript" src="userjs/tableSort.js"></script> 
    </head> 
 
    <body> 
        <table id="theTable" align="center" border="1"> 
            <thead> 
                <tr> 
                    <td> 
                        标题1  
                    </td> 
                    <td onclick="sort(theTable,1,'int')"> 
                        标题2  
                    </td> 
                    <td onclick="sort(theTable,2,'int')"> 
                        标题3  
                    </td> 
                    <td onclick="sort(theTable,3,'int')"> 
                        标题4  
                    </td> 
                    <td onclick="sort(theTable,4,'int')"> 
                        标题5  
                    </td> 
                    <td onclick="sort(theTable,5,'int')"> 
                        标题6  
                    </td> 
                    <td onclick="sort(theTable,6,'int')"> 
                        标题7  
                    </td> 
                </tr> 
            </thead> 
            <tbody> 
                <tr> 
                    <td> 
                        1  
                    </td> 
                    <td> 
                        2  
                    </td> 
                    <td> 
                        3  
                    </td> 
                    <td> 
                        4  
                    </td> 
                    <td> 
                        5  
                    </td> 
                    <td> 
                        6  
                    </td> 
                    <td> 
                        7  
                    </td> 
                </tr> 
                <tr> 
                    <td> 
                        2  
                    </td> 
                    <td> 
                        3  
                    </td> 
                    <td> 
                        4  
                    </td> 
                    <td> 
                        5  
                    </td> 
                    <td> 
                        6  
                    </td> 
                    <td> 
                        7  
                    </td> 
                    <td> 
                        1  
                    </td> 
                </tr> 
                <tr> 
                    <td> 
                        3  
                    </td> 
                    <td> 
                        4  
                    </td> 
                    <td> 
                        5  
                    </td> 
                    <td> 
                        6  
                    </td> 
                    <td> 
                        7  
                    </td> 
                    <td> 
                        1  
                    </td> 
                    <td> 
                        2  
                    </td> 
                </tr> 
                <tr> 
                    <td> 
                        4  
                    </td> 
                    <td> 
                        5  
                    </td> 
                    <td> 
                        6  
                    </td> 
                    <td> 
                        7  
                    </td> 
                    <td> 
                        1  
                    </td> 
                    <td> 
                        2  
                    </td> 
                    <td> 
                        3  
                    </td> 
                </tr> 
                <tr> 
                    <td> 
                        5  
                    </td> 
                    <td> 
                        6  
                    </td> 
                    <td> 
                        7  
                    </td> 
                    <td> 
                        1  
                    </td> 
                    <td> 
                        2  
                    </td> 
                    <td> 
                        3  
                    </td> 
                    <td> 
                        4  
                    </td> 
                </tr> 
                <tr> 
                    <td> 
                        6  
                    </td> 
                    <td> 
                        7  
                    </td> 
                    <td> 
                        1  
                    </td> 
                    <td> 
                        2  
                    </td> 
                    <td> 
                        3  
                    </td> 
                    <td> 
                        4  
                    </td> 
                    <td> 
                        5  
                    </td> 
                </tr> 
            </tbody> 
        </table> 