package org.soft.base.ctrl.dao;

import model.Admin;

import java.util.List;
import java.util.Map;

public interface AdminDao {
    /**
     * 管理员登录
     * @param admin
     * @return
     */
    public Admin loginAdmin(Admin admin);

    /**
     * 注册管理员
     * @param admin
     * @return
     */
    //  超级管理员特殊功能选项
    public boolean registerAdmin(Admin admin);

    /**
     * 管理员是否已经存在
     * @param adminNickName
     * @return
     */
    public boolean hadAdmin(String adminNickName);

    /**
     * 使用编号查询管理员部门编号
     * @param adminDepartmentId
     * @return
     */
    public String getAdminDepartmentNameById(int adminDepartmentId);

    /**
     * 通过管理员状态编号查询状态名称
     * @param adminStationId
     * @return
     */
    public String getAdminStationById(int adminStationId);

    public String getAdminPower(int adminPowerId);

    public boolean updateAdmin(Admin admin);

    public boolean updateAdminProfile(Admin admin);

    public boolean deleteAdminById(int adminId);

    public Admin getAdminById(int adminId);

    //  超级管理员功能选项
    public List<Admin> getAllAdmins();

    public List<Admin> getAllLikeAdminsName(String adminLikeName);

    /**
     * 查询全部管理员信息
     * @param conditionMap
     * @return
     */
    public List<Admin> adminList(Map<String,Object> conditionMap);

    /**
     * 根据条件查询管理员信息
     * @param conditionMap
     * @return
     */
    public List<Admin> adminQuery(Map<String,Object> conditionMap);
}
