package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Employee {
    private int employeeId;
    private String employeeName;
    private String employeePassword;
    private int employeeGender;
    private int employeeAge;
    private String employeeProfile;
    private int employeeDepartmentId;
    private int employeePowerId;
    private String employeePosition;
    private int employeeStation;
}
