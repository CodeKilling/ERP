package com.erp.root.mybatis.inventory;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.erp.root.inventory.dto.InventoryDTO;

public interface InventoryMapper {
	public int selectInventoryCount();
	public ArrayList<InventoryDTO> inventoryStatus(@Param("start") int start, @Param("end") int end);
}
