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
            /* // 全选
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
            }); */
            //全选
            
        });
    </script>
    <script type="text/javascript">
    	var test=angular.module("testapp",[]);
    	test.controller("testcon",["$scope,$http",function($scope,$http){
    		
    	}]);
    </script>
  </head>
  
  
<body ng-app="testapp">
	<div ng-controller="testcon">
		<table align="center" border="1" cellspacing="0">
			<tr>
				<td><input type="checkbox" id="special" ng-checked="flag" ng-click="checkAll()">全选/全不选</td>
				<td>id</td>
				<td>新闻列表</td>
			</tr>
			<tr>
				<td><input type="checkbox" class="common" ng-click="validate()"></td>
				<td>1</td>
				<td>视觉焦点</td>
			</tr>
			<tr>
				<td><input type="checkbox" class="common" ng-click="validate()"></td>
				<td>2</td>
				<td>财经</td>
			</tr>
			<tr>
				<td><input type="checkbox" class="common" ng-click="validate()"></td>
				<td>3</td>
				<td>汽车</td>
			</tr>
			<tr>
				<td><input type="checkbox" ng-checked="flag" ng-click="validate()"></td>
				<td>4</td>
				<td>科技</td>
			</tr>
			<tr>
				<td><input type="checkbox" ng-checked="flag" ng-click="validate()"></td>
				<td>5</td>
				<td>房产</td>
			</tr>
			<tr>
				<td><input type="checkbox" ng-checked="flag" ng-click="validate()"></td>
				<td>6</td>
				<td>旅游</td>
			</tr>
			<tr>
				<td>
					<div>
				        <input id="btnCheckReverse" type="button" value="反选" />
				    </div>
				</td>
				<th colspan="2" align="center">
					<div>
						<input id="btnSubmit" type="button" value="提交" />
					</div>
				</th>
			</tr>
		</table>
	</div>
    <div>
        
    </div>
    <div>
        <input id="btnCheckReverse" type="button" value="反选" />
        <input id="btnSubmit" type="button" value="提交" />
    </div>
</body>
</html>
