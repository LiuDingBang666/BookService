package icu.liuwisdom.core.service;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.po.Book;

import java.util.List;

//用户图书服务类接口
public interface UserBookService {
    // 根据不同条件查询图书列表
    public Page<Book> findBookList(Integer page, Integer rows,
                                   String name, String category);

    //获取热销图书
    public List<Book> findHotBooks();


    //根据图书编号获取指定图书的详细信息
    public Book findBookInfoById(String id);

    //根据图书编号查询图书并且判断库存是否足够
    public Book findBookByIdAndStock(String id);

    //    随机查找图书
    public List<Book> findRandomBook();
}
