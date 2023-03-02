package org.soft.base.ctrl.dao;

import model.Station;

import java.util.List;

public interface StationDao {
    //  超级管理员特殊功能选项
    public boolean registerStation(Station station);

    public boolean updateStation(Station station);

    public boolean deleteStationById(int stationId);

    public Station getStationById(int stationId);

    //  超级管理员功能选项
    public List<Station> getAllStations();

    public List<Station> getAllStationOptions();
}
