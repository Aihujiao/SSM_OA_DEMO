package ctrl.implement;

import ctrl.db.CRUDUtil;
import ctrl.dao.PowerDao;
import model.Power;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PowerImplement extends CRUDUtil implements PowerDao {
    @Override
    public boolean hadPower(String powerName) {
        String sql = "select powerId from powers where powerName =?";
        Object[] objects = {powerName};
        boolean exist = false;

        ResultSet rs = executeDBQuery(sql, objects);

        try {
            if(rs.next()){
                exist = true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            close(rs);
        }
        return exist;
    }

    //  添加部门
    public boolean registerPower(Power power){
        String sql = "insert into powers value (null,?,?,?)";
        String powerName = power.getPowerName();
        int powerLevel = power.getPowerLevel();
        String powerIntro = power.getPowerIntro();
        Object objects[] = {powerName,powerLevel,powerIntro};

        boolean added = executeDBUpdate(sql, objects);

        return  added;
    }

    //  修改部门信息
    public boolean updatePower(Power power){
        String sql = "update powers set powerName = ?,powerLevel = ?,powerIntro = ? where powerId = ?";
        int powerId = power.getPowerId();
        String powerName = power.getPowerName();
        int powerLevel = power.getPowerLevel();
        String powerIntro = power.getPowerIntro();

        Object objects[] = {powerName,powerLevel,powerIntro,powerId};
        boolean updated = executeDBUpdate(sql, objects);

        return updated;
    }

    //  查询部门信息
    public Power getPowerById(int powerId){
        Power power = new Power();
        String sql = "select * from powers where powerId = ?";

        Object objects[] = {powerId};
        ResultSet rs = executeDBQuery(sql, objects);

        try {
            if (rs.next()){
                String powerName = rs.getString("powerName");
                int powerLevel = rs.getInt("powerLevel");
                String powerIntro = rs.getString("powerIntro");
                power = new Power(powerId, powerName,powerLevel, powerIntro);

                return power;
            }else{
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rs);
        }
    }

    //  查询所有部门信息
    public List<Power> getAllPowers(){
        List<Power> list =new ArrayList();
        Power power = null;
        String sql = "select * from powers";

        ResultSet rs = executeDBQuery(sql, null);

        try {
            while (rs.next()){
                int powerId = rs.getInt("powerId");
                String powerName = rs.getString("powerName");
                int powerLevel = rs.getInt("powerLevel");
                String powerIntro = rs.getString("powerIntro");
                power = new Power(powerId,powerName,powerLevel,powerIntro);
                list.add(power);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rs);
        }

        return list;
    }

    @Override
    public List<Power> getAllPowerOptions() {
        List<Power> powerList = new ArrayList<>();
        Power power = null;
        String sql = "select powerName,powerLevel from powers";
        ResultSet rs = executeDBQuery(sql, null);

        try {
            while(rs.next()){
                String powerName = rs.getString("powerName");
                int powerLevel = rs.getInt("powerLevel");

                power = new Power(0,powerName,powerLevel,null);
                powerList.add(power);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rs);
        }

        return powerList;
    }

    //  删除权限信息
    public boolean deletePowerById(int powerId){

        boolean deleted =false;
        String sql = "delete from powers where powerId = ?";
        Object[] objects = {powerId};

        deleted = executeDBUpdate(sql, objects);

        return deleted;
    }
}
