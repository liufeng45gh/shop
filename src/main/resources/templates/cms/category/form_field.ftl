<tr>
    <th>分类名称：</th>
    <td><input id="category_name" type="text" class="normal" name="name" value="${(category.name)!}" /><label id="category_name_info">* 分类名称</label></td>
</tr>


<tr>
<th>父级分类：</th>
<td>
    <input id="parent_city" type="text" class="normal" readonly="true" value="${(parent.name)!}"  />
    <input type="hidden" name="parentId" value="${(parent.id)!}" />
</td>
</tr>

<script type="text/javascript" src="/cms/script/category/form-field.js"></script>