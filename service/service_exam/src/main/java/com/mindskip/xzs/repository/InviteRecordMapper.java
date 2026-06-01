package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.InviteRecord;
import org.apache.ibatis.annotations.*;

@Mapper
public interface InviteRecordMapper {
    @Select("SELECT COUNT(1) FROM t_invite_record WHERE invitee_mobile = #{mobile}")
    int countByMobile(@Param("mobile") String mobile);

    @Insert("INSERT INTO t_invite_record (inviter_id, invitee_mobile, status, create_time) " +
            "VALUES (#{inviterId}, #{inviteeMobile}, #{status}, #{createTime})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(InviteRecord record);
}
