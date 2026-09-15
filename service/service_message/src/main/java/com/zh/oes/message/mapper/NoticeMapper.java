package com.zh.oes.message.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zh.oes.message.entity.Notice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface NoticeMapper extends BaseMapper<Notice> {

    // 查询未读公告数量 (子查询去重，取最新的阅读时间判断)
    @Select("SELECT COUNT(1) FROM cms_notice n WHERE n.status = 1 AND (n.is_deleted = 0 OR n.is_deleted IS NULL) " +
            "AND NOT EXISTS (SELECT 1 FROM (SELECT member_id, notice_id, MAX(read_time) as max_read_time FROM ucenter_notice_read GROUP BY member_id, notice_id) r " +
            "WHERE r.member_id = #{memberId} AND r.notice_id = n.id AND r.max_read_time >= n.update_time)")
    int getUnreadCount(@Param("memberId") Long memberId);

    // 查询所有已发布公告 (子查询去重，避免一对多产生重复行)
    @Select("SELECT n.*, " +
            "CASE WHEN r.max_read_time IS NOT NULL AND r.max_read_time >= n.update_time THEN 1 ELSE 0 END AS isRead " +
            "FROM cms_notice n " +
            "LEFT JOIN (SELECT member_id, notice_id, MAX(read_time) as max_read_time FROM ucenter_notice_read GROUP BY member_id, notice_id) r " +
            "ON n.id = r.notice_id AND r.member_id = #{memberId} " +
            "WHERE n.status = 1 AND (n.is_deleted = 0 OR n.is_deleted IS NULL) " +
            "ORDER BY n.create_time DESC")
    List<NoticeVO> getAllNoticesWithReadStatus(@Param("memberId") Long memberId);
}
