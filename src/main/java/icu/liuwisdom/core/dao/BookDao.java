package icu.liuwisdom.core.dao;

import icu.liuwisdom.core.po.Book;
import icu.liuwisdom.core.po.OrderItem;
import icu.liuwisdom.core.po.Orders;
import icu.liuwisdom.core.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*图书接口*/
public interface BookDao {
    /*获取所有图书信息*/
    public List<Book> selectBookList(Book book);

    /*图书数量*/
    public Integer selectBookListCount(Book book);

    /*获取图书分类*/
    public List<String> selectBookTypes();

    /*新增图书信息*/
    public Integer insertBook(Book book);

    /*删除图书信息*/
    public Integer deleteBook(String bookid);

    /*根据id获取图书信息*/
    public Book selectBookById(String bookid);

    /*根据id修改图书信息*/
    public Integer updateBookById(Book book);

    /*获取热销图书*/
    public List<Book> selectHotBooks();

    /*根据图书编号查询图书并且判断库存是否足够*/
    public Book selectBookByIdAndStock(String id);

    /*随机获取图书*/
    public List<Book> selectRandomBook();

    /*修改图书表中数据*/
    public Integer updateBookNum(OrderItem orderItem);


    /*根据图书编号修改图书库存数量*/
    public Integer updateBookNumById(@Param("id") String id, @Param("num") Integer num);


    /*修改图书销量*/
    public Integer updateBookBuyNum(Book book);


    /*查询图书库存紧张且正在热销的图书*/
    public List<Book> selectHotSellBook(Book book);

    /*查询图书库存紧张且正在热销的图书总数量*/
    public Integer selectHotSellBookNum(Book book);
}
