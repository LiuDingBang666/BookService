package icu.liuwisdom.core.dao;

import icu.liuwisdom.core.po.Notice;
import icu.liuwisdom.core.po.Suggest;

import java.util.List;

/*用户建议dao接口*/
public interface SuggestDao {
    /*获取所有用户建议信息*/
    public List<Suggest> selectSuggestList(Suggest suggest);

    /*用户建议信息数量*/
    public Integer selectSuggestListCount(Suggest suggest);

    /*删除用户建议信息*/
    public Integer deleteSuggest(Integer id);

    /*新增用户建议*/
    public Integer insertSuggest(Suggest suggest);

}
