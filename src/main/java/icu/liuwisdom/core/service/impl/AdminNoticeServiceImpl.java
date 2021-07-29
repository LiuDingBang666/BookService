package icu.liuwisdom.core.service.impl;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.dao.AdminDao;
import icu.liuwisdom.core.dao.NoticeDao;
import icu.liuwisdom.core.po.Book;
import icu.liuwisdom.core.po.Notice;
import icu.liuwisdom.core.service.AdminNoticeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.traversal.NodeIterator;

import java.util.List;

/*管理员公告管理服务类*/
@Service
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {
    @Autowired
    private NoticeDao noticeDao;//自动注入公告Dao

    /*返回公告信息*/
    @Override
    public Page<Notice> findNoticeList(Integer page, Integer rows, String content) {
        // 创建公告对象
        Notice notice = new Notice();
        // 判断公告内容
        if (StringUtils.isNotBlank(content)) {
            notice.setContent(content);
        }

        // 当前页
        notice.setStart((page - 1) * rows);
        // 每页数
        notice.setRows(rows);
        // 查询公告列表
        List<Notice> notices =
                this.noticeDao.selectNoticeList(notice);
        // 查询图书列表总记录数
        Integer count = this.noticeDao.selectNoticeListCount(notice);
        // 创建Page返回对象
        Page<Notice> result = new Page<>();
        result.setPage(page);
        result.setRows(notices);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    /*新增公告*/
    @Override
    public Integer addNotice(Notice notice) {
        return this.noticeDao.insertNotice(notice);
    }

    /*删除公告*/
    @Override
    public Integer deleteNotice(Integer id) {
        return this.noticeDao.deleteNotice(id);
    }

    /*查找公告*/
    @Override
    public Notice findNoticeById(Integer id) {
        return this.noticeDao.selectNoticeById(id);
    }

    /*修改公告*/
    @Override
    public Integer AlterNoticeById(Notice notice) {
        return this.noticeDao.updateNoticeById(notice);
    }
}
