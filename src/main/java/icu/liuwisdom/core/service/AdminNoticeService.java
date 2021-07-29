package icu.liuwisdom.core.service;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.po.Book;
import icu.liuwisdom.core.po.Notice;

import java.util.List;

/*管理员公告服务接口*/
public interface AdminNoticeService {
    // 查询公告
    public Page<Notice> findNoticeList(Integer page, Integer rows,
                                       String content);

    //新增公告
    public Integer addNotice(Notice notice);

    /*删除公告信息*/
    public Integer deleteNotice(Integer id);

    /*根据公告编号查找公告信息*/
    public Notice findNoticeById(Integer id);

    /*根据id修改公告信息*/
    public Integer AlterNoticeById(Notice notice);
}
