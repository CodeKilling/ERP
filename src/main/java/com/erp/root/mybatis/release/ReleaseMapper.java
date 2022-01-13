package com.erp.root.mybatis.release;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.erp.root.release.dto.ReleaseAccountDTO;
import com.erp.root.release.dto.ReleaseDTO;
import com.erp.root.release.dto.ReleaseProductDTO;
import com.erp.root.stock.dto.StockDTO;

public interface ReleaseMapper {
	public int selectReleaseCount();
	public ArrayList<ReleaseDTO> releaseList(@Param("start") int start, @Param("end") int end);
	public int selectPreDataCount();
	public ArrayList<StockDTO> preData(@Param("start") int start, @Param("end") int end);
	public ArrayList<ReleaseProductDTO> getReleaseProductList();
	public ArrayList<ReleaseAccountDTO> getReleaseAccountList(); 
	public int releaseInsert(StockDTO dto);
	public StockDTO getStockInfo(@Param("stockNo") int stockNo);
	public ReleaseDTO getReleaseInfo(@Param("releaseNo") int releaseNo);
	public int releaseModify(ReleaseDTO dto);
	public int releaseDelete(@Param("releaseNo") int releaseNo,
							 @Param("productNo") int productNo,
							 @Param("count") int count);
}
