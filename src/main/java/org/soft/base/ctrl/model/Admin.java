package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Admin {
    private int adminId;
    private String adminNickName;
    private String adminPassword;
    private String adminProfile;
    private int adminDepartmentId;
    private int adminStationId;
    private int adminPowerLevel;
}


