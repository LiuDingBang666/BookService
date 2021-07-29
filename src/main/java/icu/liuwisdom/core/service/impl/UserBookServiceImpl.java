package icu.liuwisdom.core.service.impl;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.dao.BookDao;
import icu.liuwisdom.core.po.Book;
import icu.liuwisdom.core.service.UserBookService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/*
 * 用户图书服务接口
 * */
@Service
@Transactional
public class UserBookServiceImpl implements UserBookService {
    @Autowired
    private BookDao bookDao;//注入图书Dao

    /*根据指定条件返回图书信息*/
    @Override
    public Page<Book> findBookList(Integer page, Integer rows, String name, String category) {
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
                bookDao.selectBookList(book);

        // 查询图书列表总记录数
        Integer count = bookDao.selectBookListCount(book);
        // 创建Page返回对象
        Page<Book> result = new Page<>();
        result.setPage(page);
        result.setRows(books);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    //获取热销图书
    @Override
    public List<Book> findHotBooks() {
        return this.bookDao.selectHotBooks();
    }

    //    根据图书编号获取指定图书的详细信息
    @Override
    public Book findBookInfoById(String id) {
        return this.bookDao.selectBookById(id);
    }

    //根据图书编号查询图书并且判断库存是否足够
    @Override
    public Book findBookByIdAndStock(String id) {
        return this.bookDao.selectBookByIdAndStock(id);
    }

    //随机获取图书
    @Override
    public List<Book> findRandomBook() {
        return this.bookDao.selectRandomBook();
    }
}
