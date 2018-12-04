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
                    <div class="position"><span>分类</span><span>&gt;</span><span>分类列表</span></div>

                    <div class="content" style="min-height: 200px;">
                        <#include "tree.ftl"/>
                        <form action="/cms/self/cityadd" method="post">
                            <table class="form_table " style="font-size:12px;width:auto;margin-left:30px;">
                                <colgroup><col width="150px"></col></colgroup>
                                <tbody>
                                <tr><th></th><td>添加新分类</td></tr>
                                <tr>
                                    <th>分类id：</th>
                                    <td><input id="category_id" type="text" class="normal" name="id"    /><label id="city_id_info">* 分类id(系统生成)</label></td>
                                </tr>
                                <#include "form_field.ftl"/>

                                <tr>
                                    <th></th>
                                    <td>
                                        <button class="submit" type="submit" onclick="return checkFiled();"><span>保存设置</span></button>
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


</body></html>