package icu.liuwisdom.core.service.impl;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.dao.BookDao;
import icu.liuwisdom.core.po.Book;
import icu.liuwisdom.core.service.AdminBookSafetyStockService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/*图书安全库存服务实现类*/
@Service
@Transactional
public class AdminBookSafetyStockServiceImpl implements AdminBookSafetyStockService {
    @Autowired
    private BookDao bookDao;

    /*查询图书库存紧张且正在热销的图书*/
    @Override
    public Page<Book> findHotSellBook(Integer page, Integer rows, String name, String category) {
        // 创建图书对象
        Book book = new Book();
        // 判断图书名
        if (StringUtils.isNotBlank(name)) {
            book.setName(name);
        }
        // 判断图书分类
        if (StringUtils.isNotBlank(category)) {
            book.setCategory(category);
        }

        // 当前页
        book.setStart((page - 1) * rows);
        // 每页数
        book.setRows(rows);
        // 查询图书列表
        List<Book> books =
                bookDao.selectHotSellBook(book);
        // 查询图书列表总记录数
        Integer count = bookDao.selectHotSellBookNum(book);
        // 创建Page返回对象
        Page<Book> result = new Page<>();
        result.setPage(page);
        result.setRows(books);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

}
