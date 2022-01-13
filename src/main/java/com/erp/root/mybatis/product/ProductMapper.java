package com.erp.root.mybatis.product;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.erp.root.account.dto.AccountDTO;
import com.erp.root.product.dto.CategoryDTO;
import com.erp.root.product.dto.ProductDTO;

public interface ProductMapper {
	public int selectProductCount();
	public ArrayList<ProductDTO> productList(@Param("start") int start, @Param("end") int end);
	public int productInsert(ProductDTO dto);
	public ProductDTO productInfo(@Param("productno") int productno);
	public int productModify(ProductDTO dto);
	public int productDelete(@Param("productno") int productno);
	public ArrayList<String> productCategory();
	public ArrayList<CategoryDTO> getCategory();
	public ArrayList<AccountDTO> getAccount();
	public ArrayList<ProductDTO> productFilterList(@Param("start") int start, @Param("end") int  end, @Param("category") String category);
}
