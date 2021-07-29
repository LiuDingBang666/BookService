package icu.liuwisdom.core.service.impl;

import icu.liuwisdom.core.dao.NoticeDao;
import icu.liuwisdom.core.po.Notice;
import icu.liuwisdom.core.service.UserNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//用户公告服务实现类
@Service
@Transactional
public class UserNoticeServiceImpl implements UserNoticeService {
    @Autowired
    private NoticeDao noticeDao;//注入公告dao

    /*查询所有公告信息*/
    @Override
    public List<Notice> findAllNotices() {
        return this.noticeDao.selectNoticeListByTime();
    }
}
