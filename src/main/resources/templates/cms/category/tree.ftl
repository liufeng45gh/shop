<div class="dtree" style="float:left;text-align:left;">

    <p><a href="javascript: d.openAll();">展开</a> | <a href="javascript: d.closeAll();">关闭</a></p>


    <script type="text/javascript">
				<!--

				d = new dTree('d');

				d.add(0,-1,'点击添加根节点','/cms/self/cityadd?parent_id=0');

                <#list categoryList as category>
				 d.add(${category.id} ,${category.parent_id },'${category.name }','/cms/self/cityUpdate?id=${category.id}');
                </#list>


				document.write(d);

				//-->
			</script>

</div>