package org.soft.base.ctrl.dao;

import model.Power;

import java.util.List;

public interface PowerDao {
    public boolean hadPower(String powerName);

    public boolean registerPower(Power power);

    public boolean updatePower(Power power);

    public boolean deletePowerById(int powerId);

    public Power getPowerById(int powerId);
    
    public List<Power> getAllPowers();

    public List<Power> getAllPowerOptions();
}
