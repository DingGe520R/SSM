package com.itheima.ssm.service;

import com.itheima.ssm.domain.Permission;
import com.itheima.ssm.domain.Role;

import java.util.List;

public interface IRoleService {

     List<Role> findAll() throws Exception;

    void save(Role role) throws Exception;

    Role findById(Integer roleId) throws  Exception;

    List<Permission> findOtherPermissions(Integer roleId) throws Exception;

    void addPermissionToRole(Integer roleId, Integer[] permissionIds) throws Exception;

    void deleteRoleById(Integer roleId) throws Exception;
}
