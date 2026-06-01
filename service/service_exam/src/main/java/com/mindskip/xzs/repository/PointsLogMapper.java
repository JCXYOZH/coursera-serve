package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.PointsLog;   // 必须导入
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

@Mapper
public interface PointsLogMapper {

    @Insert("INSERT INTO t_points_log (user_id, points, type, description, create_time) " +
            "VALUES (#{userId}, #{points}, #{type}, #{description}, #{createTime})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insertPointsLog(PointsLog log);
}
