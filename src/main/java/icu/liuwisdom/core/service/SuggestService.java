package icu.liuwisdom.core.service;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.po.Notice;
import icu.liuwisdom.core.po.Suggest;

import java.util.List;

/*用户建议服务接口*/
public interface SuggestService {
    /*获取所有用户建议信息*/
    public Page<Suggest> findSuggestList(Integer page, Integer rows, String content);

    /*删除用户建议信息*/
    public Integer deleteSuggest(Integer id);

    /*新增用户建议*/
    public Integer addSuggest(Suggest suggest);
}
