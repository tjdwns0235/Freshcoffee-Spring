package com.freshcoffee.persistence.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.freshcoffee.domain.product.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> bestList() {
		return sqlSession.selectList("pdt.bestList");
	
	}
	
	@Override
	public List<ProductDTO> newList() {
		return sqlSession.selectList("pdt.newList");
	}
	
}
