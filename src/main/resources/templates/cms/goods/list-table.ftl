<table class="list_table" style="font-size:13px;">
    <thead>
    <tr style="height:30px;">
        <th width="140px">id</th>
        <th width="159px">名称</th>
        <th width="200px">分类</th>
        <th width="200px">品牌</th>
        <th width="150px">价格</th>

        <th width="180px">状态</th>

        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#list goodsList as goods>
    <tr>
        <td>${(goods.id)!}</td>

        <td>${(goods.name)!}</td>
        <td>${(goods.category.name)!}</td>
        <td>${(goods.brand.name)!}</td>
        <td>--</td>

        <td>-- </td>

    <td>


        <a href="javascript:void(0)" onclick="toEdit(${goods.id?c})">编辑</a>


    </td>
    </tr>
        </#list>
        </tbody>
</table>
