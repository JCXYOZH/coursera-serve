package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.other.KeyValue;
import com.mindskip.xzs.domain.User;
import com.mindskip.xzs.viewmodel.admin.user.UserPageRequestVM;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


@Mapper
public interface UserMapper extends BaseMapper<User> {

    /**
     * getAllUser
     *
     * @return List<User>
     */
    List<User> getAllUser();

    /**
     * getUserById
     *
     * @param id id
     * @return User
     */
    User getUserById(Integer id);

    /**
     * getUserByUserName
     *
     * @param username username
     * @return User
     */
    User getUserByUserName(String username);

    /**
     * getUserByUserNamePwd
     *
     * @param username username
     * @param pwd      pwd
     * @return User
     */
    User getUserByUserNamePwd(@Param("username") String username, @Param("pwd") String pwd);

    /**
     * getUserByUuid
     *
     * @param uuid uuid
     * @return User
     */
    User getUserByUuid(String uuid);

    /**
     * userPageList
     *
     * @param map userPageList
     * @return List<User>
     */
    List<User> userPageList(Map<String, Object> map);


    /**
     * userPageCount
     *
     * @param map map
     * @return Integer
     */
    Integer userPageCount(Map<String, Object> map);


    /**
     * @param requestVM requestVM
     * @return List<User>
     */
    List<User> userPage(UserPageRequestVM requestVM);


    /**
     * insertUser
     *
     * @param user user
     */
    void insertUser(User user);

    /**
     * insertUsers
     *
     * @param users users
     */
    void insertUsers(List<User> users);

    /**
     * updateUser
     *
     * @param user user
     */
    void updateUser(User user);

    /**
     * updateUsersAge
     *
     * @param map map
     */
    void updateUsersAge(Map<String, Object> map);

    /**
     * deleteUsersByIds
     *
     * @param ids ids
     */
    void deleteUsersByIds(List<Integer> ids);

    /**
     * insertUserSql
     *
     * @param user user
     */
    void insertUserSql(User user);


    /**
     * 增加用户积分
     * @param userId 用户ID
     * @param points 积分数量（正数增加，负数减少）
     */
    @org.apache.ibatis.annotations.Update("UPDATE t_user SET points = points + #{points} WHERE id = #{userId}")
    void addPoints(@Param("userId") Integer userId, @Param("points") Integer points);

    /**
     * 获取用户积分
     * @param userId 用户ID
     * @return 当前积分
     */
    @org.apache.ibatis.annotations.Select("SELECT points FROM t_user WHERE id = #{userId}")
    Integer getPoints(@Param("userId") Integer userId);


    Integer selectAllCount();

    List<KeyValue> selectByUserName(String userName);

    List<User> selectByIds(List<Integer> ids);


    User selectByWxOpenId(@Param("wxOpenId") String wxOpenId);
}
