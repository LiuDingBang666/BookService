package icu.liuwisdom.core.service.impl;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.dao.BookDao;
import icu.liuwisdom.core.po.Book;
import icu.liuwisdom.core.service.AdminBookService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/*管理员图书服务实现类*/
@Service
@Transactional
public class AdminBookServiceImpl implements AdminBookService {
    @Autowired
    private BookDao bookDao;//自动注入图书Dao

    /*查询图书列表*/
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


    // 获取所有图书分类
    @Override
    public List<String> findBookTypes() {
        return this.bookDao.selectBookTypes();
    }

    //新增图书
    @Override
    public Integer addBook(Book book) {
        return this.bookDao.insertBook(book);
    }

    //根据图书id删除图书
    @Override
    public Integer deleteBook(String bookid) {
        return this.bookDao.deleteBook(bookid);
    }

    /*根据图书编号查找图书信息*/
    @Override
    public Book findBookById(String bookid) {
        return this.bookDao.selectBookById(bookid);
    }

    /*根据id修改图书信息*/
    @Override
    public Integer AlterBookById(Book book) {
        return this.bookDao.updateBookById(book);
    }
}
