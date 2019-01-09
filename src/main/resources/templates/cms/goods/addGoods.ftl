<!DOCTYPE html>
<html>
<head>
	<title>后台管理</title>
    <#include "../common_header.ftl"/>

</head>
<body style="zoom: 1;">
	<div class="b-container">
		<#include "../top_menu.ftl"/>
		 <div id="modulemenu" >
           <ul class="nav">
           <li data-id="list"><a id="currentItem" href="#">快速导航 <span class="icon-caret-right"></span></a></li>

           <li  data-id="task"><a href="/cms/goods/list">商品</a>
           </li>
           <li  data-id="story"><a href="/cms/goods/add">添加商品</a>
           </li>

           </ul>
        </div>
        <div id="wrap">
             <div class="outer with-side with-transition" style="min-height: 600px;">
                    <#include "left_menu.ftl"/>

                    <div id="admin_right">
                    			<div class="position"><span>商品</span><span>|</span><span>添加商品</span></div>
                    			<div class="content form_content" >


                                        <form action="/cms/goods/add" method="post">
                                        <table class="table_new">
                                            <tbody>
                                                <tr><th width="20%"></th><td><span style="color:${KEY_RESULT_MESSAGE_COLOR?default("")};">${KEY_RESULT_MESSAGE?default("")}</span></td></tr>
                                                <tr>
                                                    <th width="20%" style="text-align:right;">商品名称:</th>
                                                    <td><input id="account_input"  class="form-control" name="name" style="display:inline-block;" /><label id="account_input_info" style="display:inline-block;">* 商品名称</label></td>
                                                </tr>
                                                <tr>
                                                    <th width="20%" style="text-align:right;">分类:</th>
                                                    <td>
                                                        <input type="hidden" id="category_id" name="categoryId"/>
                                                        <input id="category_input" readonly="readonly" class="form-control" name="category" style="display:inline-block;"/><label id="category_input_info" style="display:inline-block;">* 分类</label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th width="20%" style="text-align:right;">品牌:</th>
                                                    <td><input id="password_input"  class="form-control" name="brand" style="display:inline-block;"/><label id="brand_info" style="display:inline-block;">* 品牌</label></td>
                                                </tr>

                                                <tr>
                                                    <th></th>
                                                    <td>
                                                        <button class="btn btn-primary" type="submit" onclick="return checkFiled();">保存设置</button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                    </div>
             </div>
        </div>
	</div>

	<script type="text/javascript">
		//DOM加载完毕执行
		$(document).ready(function(){
			$("#left_menu_add").addClass("selected");
		});
		
		function checkFiled(){
			var account=$("#account_input").val();
			if(account.trim()==""){
				$("#account_input_info").css("color","red");
				$("#account_input_info").html("* 账号必须填写");
				return false;
			}
			var nick_name=$("#nick_name_input").val();
			if(nick_name.trim()==""){
				$("#nick_name_input_info").css("color","red");
				$("#nick_name_input_info").html("* 昵称必须填写");
				return false;
			}
			
			var password=$("#password_input").val();
			if(password.trim()==""){
				$("#password_input_info").css("color","red");
				$("#password_input_info").html("* 密码必须填写");
				return false;
			}
			return true;
		}
	</script>


<div style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div>
<script type="text/javascript" charset="UTF-8" src="/cms/script/goods/add.js"></script>

<SCRIPT type="text/javascript">

    var setting = {
        view: {
            dblClickExpand: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "parentId",
                rootPId: null
            },
            keep: {
                leaf: false,
                parent: false
            }
        },
        callback: {
            beforeClick: beforeClick,
            onClick: onClick
        },
        async: {
            enable: true,
            url:"/cms/category/list.json",
            dataFilter: isParentDataFilter
        }
    };

    function isParentDataFilter(treeId, parentNode, responseData) {
        if (responseData) {
            for(var i =0; i < responseData.length; i++) {
                 var isParent = findIsParent(responseData,responseData[i].id);
                responseData[i].isParent = isParent;
            }
        }
        return responseData;
    };

    function findIsParent(dataArray,parentId){
        if (dataArray) {
            for(var i =0; i < dataArray.length; i++) {
                if(dataArray[i].parentId == parentId){
                    return true;
                }
            }
        }
        return false;

    }

    var zNodes =[
        {id:1, pId:0, name:"北京"},
        {id:2, pId:0, name:"天津"},
        {id:3, pId:0, name:"上海"},
        {id:6, pId:0, name:"重庆"},
        {id:4, pId:0, name:"河北省", open:true},
        {id:41, pId:4, name:"石家庄"},
        {id:42, pId:4, name:"保定"},
        {id:43, pId:4, name:"邯郸"},
        {id:44, pId:4, name:"承德"},
        {id:5, pId:0, name:"广东省", open:true},
        {id:51, pId:5, name:"广州"},
        {id:52, pId:5, name:"深圳"},
        {id:53, pId:5, name:"东莞"},
        {id:54, pId:5, name:"佛山"},
        {id:6, pId:0, name:"福建省", open:true},
        {id:61, pId:6, name:"福州"},
        {id:62, pId:6, name:"厦门"},
        {id:63, pId:6, name:"泉州"},
        {id:64, pId:6, name:"三明"}
     ];

    function beforeClick(treeId, treeNode) {
        var check = (treeNode && !treeNode.isParent);
        if (!check) alert("只能选择终结点...");
        return check;
    }

    function onClick(e, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
        nodes = zTree.getSelectedNodes(),
        v = "";
        k = "";
        nodes.sort(function compare(a,b){return a.id-b.id;});
        for (var i=0; i < nodes.length; i++) {
            v += nodes[i].name + ",";
            k += nodes[i].id + ",";
        }
        if (v.length > 0 ) v = v.substring(0, v.length-1);

        var cityObj = $("#category_input");
        cityObj.attr("value", v);

        if (k.length > 0 ) k = k.substring(0, k.length-1);
        var idObj = $("#category_id");
        idObj.attr("value", k);
    }

    function showMenu() {
        var cityObj = $("#category_input");
        var cityOffset = $("#category_input").offset();
        $("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

        $("body").bind("mousedown", onBodyDown);
    }
    function hideMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onBodyDown);
    }
    function onBodyDown(event) {
        if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
            hideMenu();
        }
    }

    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting);
    });

</SCRIPT>
<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
    <ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
</div>
</body></html>