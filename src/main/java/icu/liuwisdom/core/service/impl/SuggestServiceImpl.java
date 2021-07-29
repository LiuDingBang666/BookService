package icu.liuwisdom.core.service.impl;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.dao.SuggestDao;
import icu.liuwisdom.core.po.Notice;
import icu.liuwisdom.core.po.Suggest;
import icu.liuwisdom.core.service.SuggestService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/*用户建议服务实现类*/
@Service
@Transactional
public class SuggestServiceImpl implements SuggestService {
    @Autowired
    private SuggestDao suggestDao;

    /*查询建议*/
    @Override
    public Page<Suggest> findSuggestList(Integer page, Integer rows, String content) {
        // 创建建议信息对象
        Suggest suggest = new Suggest();
        // 判断建议内容
        if (StringUtils.isNotBlank(content)) {
            suggest.setContent(content);
        }
        // 当前页
        suggest.setStart((page - 1) * rows);
        // 每页数
        suggest.setRows(rows);
        // 查询建议信息列表
        List<Suggest> suggests =
                this.suggestDao.selectSuggestList(suggest);
        // 查询图书列表总记录数
        Integer count = this.suggestDao.selectSuggestListCount(suggest);
        // 创建Page返回对象
        Page<Suggest> result = new Page<>();
        result.setPage(page);
        result.setRows(suggests);
        result.setSize(rows);
        result.setTotal(count);
        return result;

    }

    /*删除建议*/
    @Override
    public Integer deleteSuggest(Integer id) {
        return this.suggestDao.deleteSuggest(id);
    }

    /*新增建议*/
    @Override
    public Integer addSuggest(Suggest suggest) {
        return this.suggestDao.insertSuggest(suggest);
    }
}
