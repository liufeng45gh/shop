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
}
