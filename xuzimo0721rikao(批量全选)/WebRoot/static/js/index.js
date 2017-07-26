	//对各行的修改按钮绑定事件
	function editEvent(){
		
		$("#updateEmpModal :radio").attr("checked",false);
		$("#updateEmpModal select").empty();
	
		//获取部门列表
		$.ajax({
			url:"emp/selectDepts",
			type:"POST",
			asyn:false,//异步
			success:function(data){
				//清空下拉框中数据
				$("#updateEmpModal select").empty();
				
				//data表示要遍历的集合或数组
				//index表示下标
				//obj表示各个元素
				$.each(data,function(index,obj){
					//创建option标签
					var option = $("<option value='"+obj.dept_id+"'>"+obj.dept_name+"</option>");
					//添加到部门的下拉框中
					$("#updateEmpModal select").append(option);
				});
			}
		});
		
		var eid = $(this).attr("editEmpBtnId");
		//获取当前员工
		$.ajax({
			url:"emp/selectEmpJson",
			data:{empId:eid},
			dataType:"json",
			//async:false,
			success:function(msg){
				//console.log(emp);
				var emp = msg.data.emp;
				$("#updateEmpModal input[name=emp_id]").val(emp.emp_id);
				$("#updateEmpModal input[name=emp_name]").val(emp.emp_name);
				$("#updateEmpModal input[name=email]").val(emp.email);
				$("#updateEmpModal input[name=gender]").val([emp.gender]);
				//alert(emp.dept.dept_id);
				$("#updateEmpModal select").val(emp.dept.dept_id);
				/*$("#updateEmpModal select option[value="+emp.dept.dept_id+"]")
							.attr("selected",true);*/
				
				
			}
			
		});
		
		//alert(empId+","+empName+","+empGender+","+empEmail+","+empDept);
		//对修改用的模态框进行赋值
		/*$("#updateEmpModal input[name=emp_id]").val(empId);
		$("#updateEmpModal input[name=emp_name]").val(empName);
	    $("#updateEmpModal :radio[value="+empGender+"]").attr("checked",true);
		$("#updateEmpModal select option").attr("selected",false);*/
		
		//打开修改用的模态框
		$("#updateEmpModal").modal("show");
	}
	
	//对下拉框加载部门列表
	function loadDepts(target){
		$.ajax({
			url:"emp/selectDepts",
			type:"POST",
			asyn:false,//异步
			success:function(data){
				//清空下拉框中数据
				$(target).empty();
				
				//data表示要遍历的集合或数组
				//index表示下标
				//obj表示各个元素
				$.each(data,function(index,obj){
					//创建option标签
					var option = $("<option value='"+obj.dept_id+"'>"+obj.dept_name+"</option>");
					//添加到部门的下拉框中
					$(target).append(option);
				});
			}
		});
		
	}

//构建表格数据
function buildTable(data){
	$.each(data,function(index,obj){
		
		var empIdTd = $("<td></td>").append(obj.emp_id);
		var empNameTd = $("<td></td>").append(obj.emp_name);
		var genderTd = $("<td></td>").append(obj.gender);
		var emailTd = $("<td></td>").append(obj.email);
		var deptTd = $("<td></td>").append(obj.dept.dept_name);
		
		var editBtn = $("<button></button>")
					.addClass("btn btn-primary editEmpBtn")
					.attr("editEmpBtnId",obj.emp_id)
					.append($("<span></span>")
							.addClass("glyphicon glyphicon-pencil")
							.attr("aria-hidden",true))
					.append("修改");
		
		editBtn.click(editEvent);
		
		var delBtn = $("<button></button>")
				.addClass("btn btn-danger delEmpBtn")
				.append($("<span></span>")
						.addClass("glyphicon glyphicon-pencil")
						.attr("aria-hidden",true))
						.append("删除");
    	
		var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
		
		//添加到tr中
		var tr = $("<tr></tr>")
			.append(empIdTd)
			.append(empNameTd)
			.append(genderTd)
			.append(emailTd)
			.append(deptTd)
			.append(btnTd);
		
		//将tr添加到table中
		$("#empTable").append(tr);
			
	});
}

//构建分页信息
function buildPageInfo(pageInfo){
	$("#pageInfoBar").text("共有"+pageInfo.total+"条数据,共有"+pageInfo.pages+"页");
	
}

function buildPageNav(pageInfo){
	
	var ulEle = $("<ul></ul>").addClass("pagination");
	var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
	
	firstPageLi.click(function(){
		toPage(1);
		
	});
	
	ulEle.append(firstPageLi);
	$("nav").append(ulEle);
	
}

function toPage(num){
	$.ajax({
		url:"emp/selectPageJson",
		data:{pageno:num,pagesize:2},
		dataType:"json",
		success:function(d){
			//alert(data.code);
			//var pageInfo = d.data.pageInfo;
			//var data = pageInfo.list;
			
			//alert(d.data.pageInfo.pages);
			//构建表格数据
			buildTable(d.data.pageInfo.list);
			
			//console.log(pageInfo);
			//构建分页信息
			buildPageInfo(d.data.pageInfo);
			//构建分页导航
			buildPageNav(d.data.pageInfo);
			
		}
	});
	
	
}
$(function(){
	//通过ajax请求，获取当前页的所有数据
	toPage(1);
	
	//对新增按钮绑定事件
	$("#addEmpBtn").click(function(){
		
		//通过ajax请求获取部门信息
		loadDepts("#addEmpModal select");
		
		//打开新增用的模态框
		$("#addEmpModal").modal("show");
	});
	
	//对保存按钮绑定事件
	$("#saveEmpBtn").click(function(){
		
		var empName = $("#inputEmpName").val();
		if(empName == "" || empName == null){
			$("#inputEmpName").parent().parent().addClass("has-error");
			$("#inputEmpName").next("span").append("用户名不能为空！");
			return false;
		}
		
		var data = $("#addEmpModal form").serialize();
		$.post("emp/save",data,function(){
			//关闭模态框
			$("#addEmpModal").modal("hide");
			//重新加载当前页面
			window.location.reload();
		} );
	});
	
	
	//对保存按钮绑定事件
	$("#updateEmpBtn").click(function(){
		
		var data = $("#updateEmpModal form").serialize();
		$.post("emp/update",data,function(){
			//关闭模态框
			$("#updateEmpModal").modal("hide");
			//重新加载当前页面
			window.location.reload();
		} );
	});
	
	//对删除按钮绑定事件
	$(".delEmpBtn").click(function(){
		$("#deleteEmpModal").modal("show");
	});
	
	
	
	
});