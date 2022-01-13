package com.erp.root.mybatis.stock;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.erp.root.stock.dto.StockAccountDTO;
import com.erp.root.stock.dto.StockDTO;
import com.erp.root.stock.dto.StockProductDTO;

public interface StockMapper {
	public ArrayList<StockProductDTO> getStockProductList();
	public ArrayList<StockAccountDTO> getStockAccountList();
	//public int stockInsert(StockDTO dto);
	public void stockInsert(StockDTO dto);
	public int selectStockCount();
	public ArrayList<StockDTO> stockList(@Param("start") int start, @Param("end") int end);
	public StockDTO getStockInfo(@Param("stockNo") int stockNo);
	public int stockModify(StockDTO dto);
	public int stockDelete(@Param("stockNo") int stockNo,
						   @Param("productNo") int productNo,
						   @Param("count") int count);
}
