package icu.liuwisdom.core.service;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.po.Book;
import icu.liuwisdom.core.po.User;

import java.util.List;

/*管理员图书服务接口*/
public interface AdminBookService {
    // 查询图书列表
    public Page<Book> findBookList(Integer page, Integer rows,
                                   String name, String category);

    //    获取所有图书分类
    public List<String> findBookTypes();

    //新增图书
    public Integer addBook(Book book);

    /*删除图书信息*/
    public Integer deleteBook(String bookid);

    /*根据图书编号查找图书信息*/
    public  Book findBookById(String bookid);

    /*根据id修改图书信息*/
    public Integer AlterBookById(Book book);
}
