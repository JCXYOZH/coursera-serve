package com.mindskip.xzs.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface StudentMemberMapper {

    @Select("SELECT COUNT(1) FROM student_member WHERE mobile = #{mobile}")
    int countByMobile(String mobile);
}
