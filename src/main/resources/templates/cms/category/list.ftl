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
                    </div>



                </div>
        </div>
    </div>
</div>


</body></html>