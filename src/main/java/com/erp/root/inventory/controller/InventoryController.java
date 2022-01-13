package com.erp.root.inventory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.erp.root.inventory.Service.InventoryService;

@Controller
@RequestMapping("inventory")
public class InventoryController {
	@Autowired
	InventoryService is;
	
	@GetMapping("inventoryStatus")
	public String inventoryStatus(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		is.getInventoryStatus(model, num);
		return "inventory/inventoryStatus";
	}
}
