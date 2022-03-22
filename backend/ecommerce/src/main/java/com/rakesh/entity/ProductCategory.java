package com.rakesh.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity//To mapping the table
@Table(name="product_category")
public class ProductCategory {
	
	@Id //Primary Key	`						//SEQUENCE for ORACLESQL
	@GeneratedValue(strategy = GenerationType.IDENTITY)//used for auto-generating ID for MySQL
	@Column(name="id")
	private long id;
	
	@Column(name="category_name")
	private String categoryName;
	
	//for mapping foreign key in Product Table
	@OneToMany(mappedBy = "category", cascade = CascadeType.ALL)//one category has many products
	private Set<Product> products;

	public ProductCategory() {
		super();
	}
	
	public ProductCategory(String categoryName) {
		super();
		this.categoryName = categoryName;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "ProductCategory [id=" + id + ", categoryName=" + categoryName + ", products=" + products + "]";
	}	


}
