package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.SignRecord;
import org.apache.ibatis.annotations.*;
import java.util.Date;
import java.util.List;

@Mapper
public interface SignRecordMapper {

    @Select("SELECT * FROM t_sign_record WHERE user_id = #{userId} AND sign_date = #{signDate}")
    SignRecord getByUserIdAndDate(@Param("userId") Integer userId, @Param("signDate") Date signDate);

    @Select("SELECT continuous_days FROM t_sign_record WHERE user_id = #{userId} ORDER BY sign_date DESC LIMIT 1")
    Integer getLastContinuousDays(@Param("userId") Integer userId);

    @Insert("INSERT INTO t_sign_record (user_id, sign_date, continuous_days, points_earned, create_time) " +
            "VALUES (#{userId}, #{signDate}, #{continuousDays}, #{pointsEarned}, #{createTime})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(SignRecord record);

    @Select("SELECT sign_date FROM t_sign_record WHERE user_id = #{userId} ORDER BY sign_date DESC")
    List<Date> getSignDatesByUserId(@Param("userId") Integer userId);
}
