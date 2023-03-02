package org.soft.base.ctrl.dao;

import model.Position;

import java.util.List;

public interface PositionDao {
    public boolean registerPositon(Position position);
    public Position getPositionById(int positionId);
    public boolean updatePosition(Position position);
    public boolean deletePositionById(int positionId);
    public List<Position> getAllPositions();
    public List<Position> getAllPositionOptions();
    public List<Position> getAllLikePositionsName(String positionLikeName);
}
