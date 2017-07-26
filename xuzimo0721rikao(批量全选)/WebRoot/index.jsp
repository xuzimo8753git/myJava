<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	
	<script type="text/javascript" src="static/angular/angular.min.js"></script>
	<script type="text/javascript" src="static/js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	        <script type="text/javascript">
        $(function () {
            // 全选
            $("#btnCheckAll").bind("click", function () {
                $("[name = chkItem]:checkbox").prop("checked", true);
            });

            // 全不选
            $("#btnCheckNone").bind("click", function () {
                $("[name = chkItem]:checkbox").prop("checked", false);
            });

            // 反选
            $("#btnCheckReverse").bind("click", function () {
                $("[name = chkItem]:checkbox").each(function () {
                    $(this).prop("checked", !$(this).prop("checked"));
                });
            });

            // 提交
            $("#btnSubmit").bind("click", function () {
                var result = new Array();
                $("[name = chkItem]:checkbox").each(function () {
                    if ($(this).is(":checked")) {
                        result.push($(this).prop("value"));
                    }
                });

                alert(result.join(","));
            });
        });
    </script>
  </head>
  
  
<body>
    <div>
        <input name="chkItem" type="checkbox" value="今日话题" />今日话题<br/>
        <input name="chkItem" type="checkbox" value="视觉焦点" />视觉焦点<br/>
        <input name="chkItem" type="checkbox" value="财经" />财经<br/>
        <input name="chkItem" type="checkbox" value="汽车" />汽车<br/>
        <input name="chkItem" type="checkbox" value="科技" />科技<br/>
        <input name="chkItem" type="checkbox" value="房产" />房产<br/>
        <input name="chkItem" type="checkbox" value="旅游" />旅游
    </div>
    <div>
        <input id="btnCheckAll" type="button" value="全选" />
        <input id="btnCheckNone" type="button" value="全不选" />
        <input id="btnCheckReverse" type="button" value="反选" />
        <input id="btnSubmit" type="button" value="提交" />
    </div>
</body>
</html>
