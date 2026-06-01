package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.ExchangeItem;
import org.apache.ibatis.annotations.*;
import java.util.List;
import java.util.Date;

@Mapper
public interface ExchangeMapper {

    @Select("SELECT id, name, IFNULL(points_required,0) as pointsRequired, IFNULL(pdf_path,'') as pdfPath, create_time FROM t_exchange_item ORDER BY id")
    List<ExchangeItem> getAllItems();

    @Select("SELECT id, name, IFNULL(points_required,0) as pointsRequired, IFNULL(pdf_path,'') as pdfPath, create_time FROM t_exchange_item WHERE id = #{id}")
    ExchangeItem getItemById(@Param("id") Integer id);

    @Select("SELECT COUNT(1) FROM t_exchange_record WHERE user_id = #{userId} AND item_id = #{itemId}")
    int countUserExchange(@Param("userId") Integer userId, @Param("itemId") Integer itemId);

    @Insert("INSERT INTO t_exchange_record (user_id, item_id, exchange_time) VALUES (#{userId}, #{itemId}, #{exchangeTime})")
    void insertExchangeRecord(@Param("userId") Integer userId,
                              @Param("itemId") Integer itemId,
                              @Param("exchangeTime") Date exchangeTime);
}
