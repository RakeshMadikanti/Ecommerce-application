package com.rakesh.dao;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

import com.rakesh.entity.Product;


@CrossOrigin("http://localhost:4200")
public interface ProductRepository extends JpaRepository<Product, Long> {
	
	//TO expose Id api
	Page<Product> findByCategoryId(@RequestParam("id") Long id,Pageable pageable);
	//localhost:8080/api/products/search/findByCategoryId?id=1
	
	//to search by name
	Page<Product> findByNameContaining(@RequestParam("name") String name,Pageable pageable);
	//http://localhost:8080/api/products/search/findByNameContaining?name=java
	
	
	
}
