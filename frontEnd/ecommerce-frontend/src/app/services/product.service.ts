import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Product } from '../common/product';
import { map } from 'rxjs/operators';
import { ProductCategory } from '../common/product-category';


@Injectable({
  providedIn: 'root'
})
export class ProductService {



  private baseUrl = "http://localhost:8080/api/products";

  private categoryUrl = "http://localhost:8080/api/product-category";

  constructor(private httpClient : HttpClient) { }
  

  getProduct(productId: string):Observable<Product> {
    
    const productUrl = `${this.baseUrl}/${productId}`;
    return this.httpClient.get<Product>(productUrl);

  }

  getProductList(categoryId: number): Observable<Product[]>{
    
    const searchUrl = `${this.baseUrl}/search/findByCategoryId?id=${categoryId}`;
    return this.getProducts(searchUrl);
  
  }

  getProductCategories(): Observable<ProductCategory[]> {
    
    return this.httpClient.get<GetResponseCategory>(this.categoryUrl)
    .pipe(map(response => response._embedded.productCategories));
    

  }

  searchProducts(myKeyword: string) {
    
    const searchUrl = `${this.baseUrl}/search/findByNameContaining?name=${myKeyword}`;
    return this.getProducts(searchUrl);


  }





  


  private getProducts(searchUrl: string) {
    return this.httpClient.get<GetResponseProduct>(searchUrl)
      .pipe(map(response => response._embedded.products));
  }
}

interface GetResponseProduct{
  _embedded:{//taken api from spring
    products: Product[];
  }
}

interface GetResponseCategory{
  _embedded:{//taken api from spring
    productCategories: ProductCategory[];
  }
}
