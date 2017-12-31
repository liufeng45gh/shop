package com.lucifer.mapper.shop;

import com.lucifer.model.Category;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */
@MapperScan
public interface CategoryMapper {

    List<Category> categoryList();

    Category getCategory(String id);

    int insertCategory(Category category);

    int updateCategory(Category category);

    Category getOneChild(String parent_id);

    int delete(String id);

    List<Category> refCategoryList(Category category);

    List<Category> getCategoryTopList();

    List<Category> getCategoryChildList(String id);
}
