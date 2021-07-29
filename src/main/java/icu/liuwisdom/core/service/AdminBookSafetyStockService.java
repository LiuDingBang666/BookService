package icu.liuwisdom.core.service;

import icu.liuwisdom.common.utils.Page;
import icu.liuwisdom.core.po.Book;

import java.util.List;

/*图书安全库存服务接口*/
public interface AdminBookSafetyStockService {

    /*查询图书库存紧张且正在热销的图书*/
    public Page<Book> findHotSellBook(Integer page, Integer rows, String name, String category);

}
