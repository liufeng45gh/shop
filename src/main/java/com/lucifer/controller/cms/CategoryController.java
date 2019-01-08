package com.lucifer.controller.cms;

import com.lucifer.exception.ArgumentException;
import com.lucifer.mapper.shop.CategoryMapper;
import com.lucifer.model.Category;
import com.lucifer.service.CategoryService;
import com.lucifer.utils.RandomUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.rmi.runtime.Log;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/31.
 */
@Controller
public class CategoryController {

    @Resource
    private CategoryMapper categoryMapper;

    @Resource
    private CategoryService categoryService;

    final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value="/cms/category/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request){
        List<Category> categoryList = categoryMapper.categoryList();
        request.setAttribute("categoryList", categoryList);
        return "/cms/category/list";
    }

    @RequestMapping(value="/cms/category/add",method = RequestMethod.GET)
    public String categoryAddInput(@RequestParam("parent_id") String parentId, HttpServletRequest request){
        List<Category> categoryList = categoryMapper.categoryList();
        request.setAttribute("categoryList", categoryList);
        Category parent = null;
        if("0".equals(parentId)){
            parent=new Category();
            parent.setId("0");
            parent.setName("根节点");
        }else{
            parent = categoryMapper.getCategory(parentId);
        }
        request.setAttribute("parent", parent);


        //request.setAttribute("nextCategoryId", nextCategoryId);

        return "/cms/category/add";
    }
    @RequestMapping(value="/cms/category/add",method = RequestMethod.POST)
    public String categoryAddSubmit(Category category) throws ArgumentException {
        //log.info(city);
        //log.info(city.getId());
        String nextCategoryId = categoryService.getNextCategoryId(category.getParentId());
        category.setId(nextCategoryId);
        categoryMapper.insertCategory(category);
        return "redirect:/cms/category/list";
    }

    @RequestMapping(value="/cms/category/update",method = RequestMethod.GET)
    public String categoryUpdateInput(String id,HttpServletRequest request){
        list(request);
        Category category = categoryMapper.getCategory(id);
        Category child = categoryMapper.getOneChild(category.getId());
        if(null != child){
            category.setTerminal(false);
        }else{
            category.setTerminal(true);
        }
        Category parent=null;
        if(category.getParentId().equals("0")){
            parent=new Category();
            parent.setId("0");
            parent.setName("根节点");
        }else{
            parent = categoryMapper.getCategory(category.getParentId());
        }
        request.setAttribute("parent", parent);

        request.setAttribute("category", category);
        return "/cms/category/update";
    }

    @RequestMapping(value="/cms/category/update",method = RequestMethod.POST)
    public String categoryUpdateSubmit(Category category){
        categoryMapper.updateCategory(category);
        return "redirect:/cms/category/list";
    }

    @RequestMapping(value="/cms/category/delete",method = RequestMethod.POST)
    public String delete(String id){
        categoryMapper.delete(id);
        return "redirect:/cms/category/list";
    }

    @RequestMapping(value="/cms/category/exist",method = RequestMethod.GET)
    @ResponseBody
    public Map isCityExist(String id){
        Map resultMap = new HashMap();
        Category category =categoryMapper.getCategory(id);
        if(null==category){
            resultMap.put("is_exist", false);
        }else{
            resultMap.put("is_exist", true);
        }
        return resultMap;
    }

    @RequestMapping(value="/cms/category/all-data.json",method = RequestMethod.GET)
    @ResponseBody
    public List json(){
        List<Category> categoryListList = categoryMapper.categoryList();
        return categoryService.toComboTreeData(categoryListList);
    }


    @RequestMapping(value="/cms/category/tree-select",method = RequestMethod.GET)
    public String treeSelect(HttpServletRequest request){
        List<Category> categoryList = categoryMapper.categoryList();
        request.setAttribute("categoryList", categoryList);
        return "/cms/category/tree-select";
    }
}
