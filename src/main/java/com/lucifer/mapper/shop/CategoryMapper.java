package com.lucifer.mapper.shop;

import com.lucifer.annotation.MapperScanShop;
import com.lucifer.model.Category;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */
@MapperScanShop
public interface CategoryMapper {

    List<Category> categoryList();

    Category getCategory(String id);

    int insertCategory(Category category);

    int updateCategory(Category category);

    Category getOneChild(@Param(value = "parentId") String parentId);

    int delete(String id);

    List<Category> refCategoryList(Category category);

    List<Category> getCategoryTopList();

    List<Category> getCategoryChildList(String id);

    String getMaxCategoryId(@Param(value = "parentId") String parentId);
}
