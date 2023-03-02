package ctrl.implement;

import ctrl.dao.SplitDao;
import ctrl.db.ORMUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class SplitImplement extends ORMUtil implements SplitDao {

    @Override
    public int getTableRowCount(String sql, Object[] objects) {
        ResultSet rs = executeDBQuery(sql, objects);
        int count = 0;
        try {
            if(rs.next()){
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            close(rs);
        }
        return count;

    }

    @Override
    public int getAllPages(int size, int count) {
        int allPage = 0;
        if(count % size  != 0){
            allPage = count / size  + 1;
        }else{
            allPage = count / size;
        }
        return allPage;
    }

    @Override
    public int getBeginRow(int size, int currentPageNum) {
        int begin  = size * (currentPageNum - 1);
        return begin;
    }

    @Override
    public List getCurrentPageInfo(String sql, Object[] objects, Class classes) {
        List list = getORMS(sql,objects,classes);
        return list;
    }
}
