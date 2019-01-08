<html>
<head>
    <link rel="stylesheet" href="/ztree/zTree_v3/css/demo.css" type="text/css"/>
    <link rel="stylesheet" href="/ztree/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
    <script type="text/javascript" src="/ztree/zTree_v3/js/jquery.ztree.core.js"></script>
</head>
<body>
<div class="dtree" style="float:left;text-align:left;">

    <p><a href="javascript: d.openAll();">展开</a> | <a href="javascript: d.closeAll();">关闭</a></p>


    <script type="text/javascript">
				<!--

				d = new dTree('d');

				d.add(0,-1,'根节点','javascript:void(0)');

                <#list categoryList as category>
				 d.add(${category.id} ,${category.parentId },'${category.name }','javascript:selectNode(${category.id},\'${category.name }\')');
                </#list>


				document.write(d);

				//-->
			</script>

</div>

<script>
function selectNode(id,name){
    window.parent.selectNode(id,name);

}
</script>
</body>




</html>