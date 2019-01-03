package com.lucifer.controller.cms;

import com.lucifer.mapper.shop.GoodsMapper;
import com.lucifer.model.Goods;
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
    public String list(@RequestParam(value = "page",defaultValue = "1") Integer page, HttpServletRequest request){
        Integer count = 30;
        Integer offset = (page - 1) * count;
        List<Goods> goodsList = goodsMapper.goodsList(offset,count);
        request.setAttribute("goodsList",goodsList);
        return "/cms/goods/list";
    }

}
