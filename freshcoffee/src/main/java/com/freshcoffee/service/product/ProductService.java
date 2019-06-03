package com.freshcoffee.service.product;

import java.util.HashMap;
import java.util.List;

import com.freshcoffee.domain.product.ProductDTO;

public interface ProductService {
	
//	베스트상과 신상품
	public HashMap<String, List<ProductDTO>> productList();
}
