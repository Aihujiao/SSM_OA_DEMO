package ctrl.implement;

import ctrl.db.CRUDUtil;
import ctrl.dao.StationDao;
import model.Station;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StationImplement extends CRUDUtil implements StationDao {
    //  添加部门
    public boolean registerStation(Station station){
        String sql = "insert into stations value (null,?,?)";
        String stationName = station.getStationName();
        String stationIntro = station.getStationIntro();
        Object objects[] = {stationName,stationIntro};

        boolean added = executeDBUpdate(sql, objects);

        return  added;
    }

    //  修改部门信息
    public boolean updateStation(Station station){
        String sql = "update stations set stationName =?,stationIntro = ? where stationId = ?";
        int stationId = station.getStationId();
        String stationName = station.getStationName();
        String stationIntro = station.getStationIntro();

        Object objects[] = {stationName,stationIntro,stationId};
        boolean updated = executeDBUpdate(sql, objects);

        return updated;
    }

    //  查询部门信息
    public Station getStationById(int stationId){
        Station station;
        String sql = "select * from stations where stationId = ?";

        Object objects[] = {stationId};
        ResultSet rs = executeDBQuery(sql, objects);

        try {
            if (rs.next()){
                String stationName = rs.getString("stationName");
                String stationIntro = rs.getString("stationIntro");
                station = new Station(stationId, stationName, stationIntro);

                return station;
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
    public List<Station> getAllStations(){
        List<Station> stationList =new ArrayList();
        Station station = null;
        String sql = "select * from stations";

        ResultSet rs = executeDBQuery(sql, null);

        try {
            while (rs.next()){
                int stationId = rs.getInt("stationId");
                String stationName = rs.getString("stationName");
                String stationIntro = rs.getString("stationIntro");
                station = new Station(stationId,stationName,stationIntro);
                stationList.add(station);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rs);
        }

        return stationList;
    }

    @Override
    public List<Station> getAllStationOptions() {
        List<Station> stationList =new ArrayList();
        Station station = null;
        String sql = "select stationId,stationName from stations";

        ResultSet rs = executeDBQuery(sql, null);

        try {
            while (rs.next()){
                int stationId = rs.getInt("stationId");
                String stationName = rs.getString("stationName");

                station = new Station(stationId,stationName,null);
                stationList.add(station);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rs);
        }

        return stationList;
    }

    //  超级管理员
    //  删除状态信息
    public boolean deleteStationById(int stationId){
        boolean deleted = false;
        String sql = "delete from stations where stationId = ?";
        Object[] objects = {stationId};

        deleted = executeDBUpdate(sql, objects);

        return deleted;
    }


}
