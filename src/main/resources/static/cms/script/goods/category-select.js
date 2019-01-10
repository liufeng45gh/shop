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
    var maxZIndex = getMaxZIndex();
    //$("#menuContent").css({zIndex: maxZIndex});
    $("#menuContent").css({zIndex: maxZIndex, left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

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

function getMaxZIndex() {
    var maxZ = Math.max.apply(null,
    　　$.map($('body *'), function(e,n) {
      　　if ($(e).css('position') != 'static')
        　　return parseInt($(e).css('z-index')) || -1;
    }));
    return maxZ;
}


$(document).ready(function(){
    $.fn.zTree.init($("#treeDemo"), setting);
});
