package org.soft.base.ctrl.dao;

import model.Employee;

import java.util.List;

public interface EmployeeDao {
    public Employee loginEmployee(Employee employee);

    //  超级管理员特殊功能选项
    public boolean registerEmployee(Employee employee);

    public boolean updateEmployee(Employee employee);

    public boolean deleteEmployeeById(int employeeId);

    public Employee getEmployeeById(int employeeId);

    //  超级管理员功能选项
    public List<Employee> getAllEmployees();
}
