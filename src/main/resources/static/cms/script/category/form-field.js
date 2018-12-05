//DOM加载完毕执行
	$(document).ready(function(){
		$("#left_menu_category").addClass("selected");
	});

	function checkFiled(){

		var category_name=$("#category_name").val();
		if(category_name.trim()==""){
			$("#category_name_info").css("color","red");
			$("#category_name_info").html("* 分类名称必须填写");
			return false;
		}else{
			$("#category_name_info").css("color","green");
			$("#category_name_info").html("√");
		}

		return true;
	}

