package org.soft.base.ctrl.dao;

import java.util.List;

public interface SplitDao {
    /**
     * 求查询语句中的结果集中的总行数
     * @param sql
     * @param objects
     * @return
     */
    public int getTableRowCount(String sql,Object[] objects);

    /**
     * 得到总页数
     * @param size
     * @param count
     * @return
     */
    public int getAllPages(int size,int count);

    /**
     * 得到当前数据位置
     * @param size
     * @param currentPageNum
     * @return
     */
    public int getBeginRow(int size,int currentPageNum);

    /**
     * 得到当前页的数据
     * @param sql
     * @param objects
     * @param classes
     * @return
     */
    public List getCurrentPageInfo(String sql,Object[] objects,Class classes);
}
