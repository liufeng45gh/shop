package com.lucifer.controller.cms;

import com.lucifer.mapper.shop.GoodsMapper;
import com.lucifer.model.Goods;
import com.lucifer.utils.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CmsGoodsController {

    @Resource
    GoodsMapper goodsMapper;

    @RequestMapping(value="/cms/goods/list",method = RequestMethod.GET)
    public String list(@RequestParam(value = "page",defaultValue = "1") Integer page,
                       @RequestParam(value = "name",required = false) String name,
                       @RequestParam (value = "categoryId",required = false) String categoryId,
                       HttpServletRequest request,Goods searchParam){
        Integer perPageCount = 30;
        Integer offset = (page - 1) * perPageCount;
        List<Goods> goodsList = goodsMapper.goodsCmsSearchList(offset,perPageCount,name,categoryId);
        request.setAttribute("goodsList",goodsList);

        Integer matchRecordCount=goodsMapper.goodsCmsSearchCount(searchParam);
        Integer totalPageCount= PageUtil.getTotalPageCount(matchRecordCount, perPageCount);

        PageUtil pageUtil = new PageUtil(request);
        String pageDiv = pageUtil.willPaginate(totalPageCount,  "pages_bar",new String []{"page","msg"});
        request.setAttribute("pageDiv",pageDiv);
        request.setAttribute("searchParam",searchParam);


        return "/cms/goods/list";
    }

    @RequestMapping(value="/cms/goods/add",method = RequestMethod.GET)
    public String toAddUser(){
        return "/cms/goods/addGoods";
    }

}
