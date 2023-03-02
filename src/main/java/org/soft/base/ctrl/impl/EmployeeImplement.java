package ctrl.implement;

import ctrl.dao.EmployeeDao;
import ctrl.db.CRUDUtil;
import model.Employee;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeImplement extends CRUDUtil implements EmployeeDao {
    @Override
    public Employee loginEmployee(Employee employee) {
        System.out.println("进入员工登陆页面");
        String employeeName = employee.getEmployeeName();
        String employeePassword =employee.getEmployeePassword();

        String sql = "select * from employees where employeeName = ? and employeePassword = ?";
        Object[] objects = {employeeName,employeePassword};

        ResultSet rs = executeDBQuery(sql, objects);

        try {
            if(rs.next()){
                //  数据库数据赋值
                int employeeId = rs.getInt("employeeId");
                int employeeGender = rs.getInt("employeeGender");
                int employeeAge = rs.getInt("employeeAge");
                String employeeProfile = rs.getString("employeeProfile");
                int employeeDepartmentId = rs.getInt("employeeDepartmentId");
                int employeePowerId = rs.getInt("employeePowerId");
                String employeePosition = rs.getString("employeePosition");
                int employeeStation = rs.getInt("employeeStation");

                employee = new Employee(employeeId,employeeName,employeePassword,employeeGender,employeeAge,employeeProfile,employeeDepartmentId,employeePowerId,employeePosition,employeeStation);

                return employee;
            }else{
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            close(rs);
        }

    }

    //  为部门添加员工
    @Override
    public boolean registerEmployee(Employee employee) {
        String employeeName = employee.getEmployeeName();
        String employeePassword =employee.getEmployeePassword();
        int employeeGender = employee.getEmployeeGender();
        int employeeAge = employee.getEmployeeAge();
        String employeeProfile = employee.getEmployeeProfile();
        int employeeDepartmentId = employee.getEmployeeDepartmentId();
        String employeePosition = employee.getEmployeePosition();
        int employeeStation = employee.getEmployeeStation();

        String sql = "insert into employees value(null,?,?,?,?,?,?,?,?)";
        Object objects[] = {employeeName,employeePassword,employeeGender,employeeAge,employeeProfile,employeeDepartmentId,employeePosition,employeeStation};

        boolean registered = executeDBUpdate(sql, objects);

        return registered;
    }

    //  更新员工信息
    public boolean updateEmployee(Employee employee){
        String sql = "update employees set employeeName = ?,employeePassword = ?,employeeGender = ?,employeeAge = ?,employeeProfile = ?,employeeDepartmentId = ?,employeePosition = ?,employeeStation = ? where employeeId = ?";
        String employeeName = employee.getEmployeeName();
        String employeePassword =employee.getEmployeePassword();
        int employeeGender = employee.getEmployeeGender();
        int employeeAge = employee.getEmployeeAge();
        String employeeProfile = employee.getEmployeeProfile();
        int employeeDepartmentId = employee.getEmployeeDepartmentId();
        int employeePowerId = employee.getEmployeePowerId();
        String employeePosition = employee.getEmployeePosition();
        int employeeStation = employee.getEmployeeStation();
        int employeeId = employee.getEmployeeId();

        Object objects[] ={employeeName,employeePassword,employeeGender,employeeAge,employeeProfile,employeeDepartmentId,employeePosition,employeePowerId,employeeStation,employeeId};
        boolean updated = executeDBUpdate(sql, objects);

        return updated;
    }

    @Override
    public boolean deleteEmployeeById(int employeeId) {
        String sql = "delete from employees where employeeId = ?";
        Object[] objects = {employeeId};

        boolean deleted = executeDBUpdate(sql, objects);

        return deleted;
    }

    //  查询某位员工信息
    @Override
    public Employee getEmployeeById(int employeeId) {
        Employee employee = null;
        String sql = "select * from employees where employeeId = ?";
        Object objects[] = {employeeId};

        ResultSet rs = executeDBQuery(sql, objects);

        try {
            if(rs.next()){
                String employeeName = rs.getString("employeeName");
                String employeePassword = rs.getString("employeePassword");
                int employeeGender = rs.getInt("employeeGender");
                int employeeAge = rs.getInt("employeeAge");
                String employeeProfile = rs.getString("employeeProfile");
                int employeeDepartmentId = rs.getInt("employeeDepartmentId");
                int employeePowerId = rs.getInt("employeePowerId");
                String employeePosition = rs.getString("employeePosition");
                int employeeStation = rs.getInt("employeeStation");
                employee = new Employee(employeeId,employeeName,employeePassword,employeeGender,employeeAge,employeeProfile,employeeDepartmentId,employeePowerId,employeePosition,employeeStation);
            }

            close(rs);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rs);
        }

        return employee;
    }

    @Override
    public List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        Employee employee = new Employee();
        String sql = "select * from employees";

        ResultSet rs = executeDBQuery(sql, null);

        try {
            while (rs.next()){
                int employeeId = rs.getInt("employeeId") ;
                String employeeName = rs.getString("employeeName");
                String employeePassword = rs.getString("employeePassword");
                int employeeGender = rs.getInt("employeeGender");
                int employeeAge = rs.getInt("employeeAge");
                String employeeProfile = rs.getString("employeeProfile");
                int employeeDepartmentId = rs.getInt("employeeDepartmentId");
                int employeePowerId = rs.getInt("employeePowerId");
                String employeePosition = rs.getString("employeePosition");
                int employeeStation = rs.getInt("employeeStation");

                //  将每一轮的数据插入对应对象
                employee = new Employee(employeeId,employeeName,employeePassword,employeeGender,employeeAge,employeeProfile,employeeDepartmentId,employeePowerId,employeePosition,employeeStation);

                //  将本轮对象插入到员工结果集
                list.add(employee);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rs);
        }

        return list;
    }


}
