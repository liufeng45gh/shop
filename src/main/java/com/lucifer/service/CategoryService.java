package com.lucifer.service;

import com.lucifer.mapper.shop.CategoryMapper;
import com.lucifer.model.Category;
import com.lucifer.utils.StringHelper;
import com.lucifer.utils.WxPinYinHelper;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/31.
 */
public class CategoryService {

    @Resource
    private CategoryMapper categoryMapper;

    public List<String> refCategoryNameList(String name) throws BadHanyuPinyinOutputFormatCombination {
        List<String> categoryNameList = new ArrayList<String>();
        if(StringHelper.isEmpty(name)){
            return categoryNameList;
        }
        String name_py = WxPinYinHelper.getHanYuPinYin(name);
        Category industry = new Category();
        industry.setName(name);
        List<Category> dbCategoryList= categoryMapper.refCategoryList(industry);
        for(Category dbCategory :dbCategoryList){
            if(categoryNameList.contains(dbCategory.getName())){
                continue;
            }
            categoryNameList.add(dbCategory.getName());
        }
        return categoryNameList;
    }

    public List toComboTreeData(List<Category> categoryList ){
        Map<String,Category> tempMap = new HashMap<String,Category>();
        for(Category category:categoryList){
            tempMap.put(category.getId(), category);
        }
        List<Category> resultList = new ArrayList<Category>();
        for(Category category:categoryList){
            if(category.getId().length()>4){
                Category parent = tempMap.get(category.getId().substring(0, category.getId().length()-4));
                parent.children.add(category);
            }else{
                resultList.add(category);
            }
        }
        return resultList;

    }
}
