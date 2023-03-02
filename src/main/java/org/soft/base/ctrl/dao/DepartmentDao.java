package org.soft.base.ctrl.dao;

import model.Department;

import java.util.List;

public interface DepartmentDao {

    public boolean registDepartment(Department department);

    public Department getDepartmentById(int DepartmentId);

    public List<Department> getAllDepartment();

    public boolean updateDepartment(Department department);

    public boolean deleteDepartmentById(int departmentId);

    public List<Department> getDepartmentsByLikeName(String departmentLikeName);

    public List<Department> getAllDepartmentOptions();

}
