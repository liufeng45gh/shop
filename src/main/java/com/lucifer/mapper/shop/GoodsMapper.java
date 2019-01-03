package com.lucifer.mapper.shop;

import com.lucifer.annotation.MapperScanShop;
import com.lucifer.model.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@MapperScanShop
public interface GoodsMapper {

    List<Goods> goodsList(@Param(value = "offset") Integer offset, @Param(value = "count") Integer count);
}
