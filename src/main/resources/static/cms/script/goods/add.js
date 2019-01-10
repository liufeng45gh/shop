$("#category_input").click(function (){
//    layer.open({
//      type: 2,
//      area: ['40%', '80%'],
//      fixed: false, //不固定
//      maxmin: true,
//      content: "/cms/category/tree-select"
//    });
    showMenu();

});

function selectNode(id,name){
    $("#category_id").val(id);
    $("#category_input").val(name);
    layer.closeAll();
}
$(function(){
    var ue = UE.getEditor('editor');
});
