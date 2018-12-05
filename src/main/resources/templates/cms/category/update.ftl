<!DOCTYPE html>
<html>
<head>
    <title>后台管理</title>
    <#include "../common_header.ftl"/>

</head>
<body style="zoom: 1;">
<div class="b-container">
    <#include "../top_menu.ftl"/>
    <#include "../quick_menu.ftl"/>
    <div id="wrap">
        <div class="outer with-side with-transition" style="min-height: 600px;">
            <#include "left_menu.ftl"/>

            <div id="admin_right">
                <div class="content_box" style="border:none">
                    <div class="position"><span>分类</span><span>&gt;</span><span>修改分类</span></div>

                    <div class="content" style="min-height: 200px;">
                        <#include "tree.ftl"/>
                        <form action="/cms/category/add" method="post" id="category_from">
                            <table class="form_table " style="font-size:12px;width:auto;margin-left:30px;">
                                <colgroup><col width="150px"></col></colgroup>
                                <tbody>
                                <tr><th></th><td>修改分类</td></tr>

                                <tr>
                                    <th>分类id：</th>
                                    <td><input id="category_id" type="text" class="normal" name="id"  readonly="readonly" value="${category.id }"  /><label id="category_id_info">* 分类id</label></td>
                                </tr>

                                <#include "form_field.ftl"/>

                                <tr>
                                    <th></th>
                                    <td>
                                        <button class="btn btn-primary" type="submit" onclick="return checkFiled();"><span>保存设置</span></button>
                                        <#if (category.terminal)>
                                            <button class="btn btn-primary" type="button" onclick="delCategory();" ><span>删除节点</span></button>
                                        </#if>
                                        <button class="btn btn-primary" type="button" onclick="addCategory();" ><span>添加子节点</span></button>
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
function delCategory(){
	if(confirm("确定删除分类?")){
		$("#category_from").attr("action","/cms/category/delete");
		$("#category_from").submit();
	}

}

function addCategory(){
	window.location.href="/cms/category/add?parent_id=${category.id}"
}
</script>

</body></html>