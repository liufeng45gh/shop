package com.lucifer.config;

import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

/**
 * Created by Administrator on 2017/12/23.
 */
@Configuration
@AutoConfigureAfter(MyBatisConfiguration.class)
public class MyBatisShopMapperScannerConfig {

    @Bean(name="shopMapperScannerConfigurer")
    public MapperScannerConfigurer mapperScannerConfigurer() {
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setSqlSessionFactoryBeanName("shopSqlSessionFactory");
        mapperScannerConfigurer.setBasePackage("com.lucifer.mapper.shop");
        mapperScannerConfigurer.setAnnotationClass(com.lucifer.annotation.MapperScanShop.class);
        return mapperScannerConfigurer;
    }
}
