import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CartItem } from 'src/app/common/cart-item';
import { Product } from 'src/app/common/product';
import { CartService } from 'src/app/services/cart.service';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-product-list',
  //templateUrl: './product-list.component.html',
  //templateUrl: './product-list.table.component.html',
  templateUrl: './product-list.grid.component.html',

  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {

  products: Product[];
  currentCategoryId: number;
  searchMode: boolean;


  constructor(private productService: ProductService, private route: ActivatedRoute, private cartService: CartService) { 

  }

  ngOnInit(): void {
    this.route.paramMap.subscribe(() => {
    this.listProducts();
    });
  }

  //to get data back from Service
  listProducts(){
    
    this.searchMode = this.route.snapshot.paramMap.has('keyword');
    
    if(this.searchMode){

      this.handleSearchProducts();
    
    }else{

      this.handleListProducts();
    
    }


  }
  handleSearchProducts() {
    
    const myKeyword = this.route.snapshot.paramMap.get('keyword');

    this.productService.searchProducts(myKeyword).subscribe(
      data =>{
        this.products  = data;
      });
  
  }



  //method for search
  handleListProducts(){
    const hasCategoryId: boolean = this.route.snapshot.paramMap.has('id');

    if(hasCategoryId){
                                //+ -->typecasting to integer
      this.currentCategoryId = +this.route.snapshot.paramMap.get('id');

    }else{

      this.currentCategoryId = 1;//if category_id is not assigned show id=1

    }


    this.productService.getProductList(this.currentCategoryId).subscribe(data => {
     // console.log(data);
      this.products = data;//storing in array
    })

  }

  addToCart(product: Product){

    console.log(`Adding to Cart: ${product.name},${product.unitPrice}`);

    const cartItem = new CartItem(product);
    
    this.cartService.addToCart(cartItem);


  }



}


