package icu.liuwisdom.core.service;

import icu.liuwisdom.core.po.Notice;

import java.util.List;

//公告服务类接口
public interface UserNoticeService {
    //展示所有公告
    public List<Notice> findAllNotices();

}
