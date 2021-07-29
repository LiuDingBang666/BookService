package icu.liuwisdom.core.dao;

import icu.liuwisdom.core.po.Book;
import icu.liuwisdom.core.po.Notice;

import java.util.List;

/*公告接口*/
public interface NoticeDao {
    /*获取所有公告信息*/
    public List<Notice> selectNoticeList(Notice notice);

    /*公告数量*/
    public Integer selectNoticeListCount(Notice notice);

    /*新增公告信息*/
    public Integer insertNotice(Notice notice);

    /*删除公告信息*/
    public Integer deleteNotice(Integer id);

    /*根据id获取公告信息*/
    public Notice selectNoticeById(Integer id);

    /*根据id修改公告信息*/
    public Integer updateNoticeById(Notice notice);

    /*获取最近的三条公告信息*/
    public List<Notice> selectNoticeListByTime();
}
