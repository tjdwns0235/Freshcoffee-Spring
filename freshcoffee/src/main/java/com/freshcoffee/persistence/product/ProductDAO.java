package com.freshcoffee.persistence.product;

import java.util.List;

import com.freshcoffee.domain.product.ProductDTO;

public interface ProductDAO {
	public List<ProductDTO> bestList(); // 베스트 상품
	public List<ProductDTO> newList(); // 신상품
}
