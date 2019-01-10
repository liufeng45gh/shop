<!DOCTYPE html>
<html>
<head>
	<title>后台管理</title>
    <#include "../common_header.ftl"/>
    <script type="text/javascript" charset="utf-8" src="/ueditor-1.4.3.3/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/ueditor-1.4.3.3/_examples/editor_api.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="/ueditor-1.4.3.3/lang/zh-cn/zh-cn.js"></script>

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
                                                    <th width="20%" style="text-align:right;">详情:</th>
                                                    <td>


                                                        <textarea id="editor" style="width:1024px;height:500px;" name="content"></textarea>

                                                    </td>
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
<script type="text/javascript" charset="UTF-8" src="/cms/script/goods/category-select.js"></script>

<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
    <ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
</div>
</body></html>