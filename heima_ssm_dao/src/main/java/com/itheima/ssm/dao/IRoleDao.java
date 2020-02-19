package com.itheima.ssm.dao;

import com.itheima.ssm.domain.Permission;
import com.itheima.ssm.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRoleDao {

    //根据用户id查询出所有用户角色
    @Select("select * from  role where  id  in (select roleId from  users_role where userId=#{userId})")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "roleName", column = "roleName"),
            @Result(property = "roleDesc", column = "roleDesc"),
            @Result(property = "permissions", column = "id",javaType = java.util.List.class ,many = @Many(select = "com.itheima.ssm.dao.IPermissionDao.findPermissionByRoleId"))
    })
    public List<Role> findRoleByUserId(Integer userId) throws Exception;


    @Select("select * from role")
    List<Role> findAll()throws Exception;

    @Insert("INSERT into role (roleName,roleDesc) VALUES (#{roleName},#{roleDesc});")
    void save(Role role);

    @Select("SELECT * from role where id=#{roleId}")
    Role findById(Integer roleId);

    @Select("SELECT * from permission WHERE id not in (SELECT permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findOtherPermissions(Integer roleId);

    @Select("insert into role_permission (roleId,permissionId) VALUES (#{roleId},#{permissionId});")
    void addPermissionToRole(@Param("roleId") Integer roleId,@Param("permissionId") Integer permissionId);

    @Delete("delete from users_role where roleId=#{roleId}")
    void deleteFromUser_RoleByRoleId(Integer roleId);
    @Delete("delete from role_permission where roleId=#{roleId}")
    void deleteFromRole_PermissionByRoleId(Integer roleId);

    @Delete("delete from role where id=#{roleId}")
    void deleteRoleById(Integer roleId);
}
