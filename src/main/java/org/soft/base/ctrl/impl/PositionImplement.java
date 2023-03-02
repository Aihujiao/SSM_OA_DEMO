package ctrl.implement;

import ctrl.dao.PositionDao;
import ctrl.db.ORMUtil;
import model.Position;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionImplement extends ORMUtil implements PositionDao {
    @Override
    public boolean registerPositon(Position position) {
        boolean registered = false;
        String sql = "insert into positions value (0,?,?)";
        String positionName = position.getPositionName();
        String positionIntro = position.getPositionIntro();
        Object[] objects = {positionName,positionIntro};

        registered = executeDBUpdate(sql, objects);

        return registered;
    }

    @Override
    public Position getPositionById(int positionId) {
        Position position = null;
        String sql = "select * from positions where positionId = ?";
        Object[] objects = {positionId};

        position = (Position) getORM(sql, objects, Position.class);

        return position;
    }

    @Override
    public boolean updatePosition(Position position) {
        String sql = "update set  positionName = ?,positionIntro = ? where positionId =?";
        String positionName = position.getPositionName();
        String positionIntro = position.getPositionIntro();
        int positionId = position.getPositionId();
        Object[] objects = {positionId,positionName,positionIntro};
        boolean updated = false;

        updated = executeDBUpdate(sql, objects);

        return updated;
    }

    @Override
    public boolean deletePositionById(int positionId) {
        boolean deleted = false;
        String sql ="delete from positions where positionId = ?";
        Object[] objects ={positionId};
        deleted = executeDBUpdate(sql, objects);

        return deleted;
    }

    @Override
    public List<Position> getAllPositions() {
        List<Position> positions = new ArrayList<>();
        String sql = "select * from positions";
        positions = (List<Position>) getORMS(sql, null, Position.class);

        return positions;
    }

    @Override
    public List<Position> getAllPositionOptions() {
        List<Position> positions = new ArrayList<>();
        String sql = "select positionId,positionName from positions";
        positions = (List<Position>) getORMS(sql, null, Position.class);

        return positions;
    }

    @Override
    public List<Position> getAllLikePositionsName(String positionLikeName) {
        List<Position> positions = new ArrayList<>();
        String sql = "select * from position where positionName like ?";
        Object[] objects = {positionLikeName};
        //  需要加上
        ResultSet rs = executeDBQuery(sql, objects);

        try {
            while(rs.next()){
                Position position = null;
                int positionId = rs.getInt("positionId");
                String positionName =rs.getString("positionName");
                String positionIntro = rs.getString("positionIntro");
                position = new Position(positionId,positionName,positionIntro);
                positions.add(position);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rs);
        }

        return positions;
    }


}
