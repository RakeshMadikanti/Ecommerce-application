import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { CartItem } from '../common/cart-item';

@Injectable({
  providedIn: 'root'
})
export class CartService {


  cartItems: CartItem[] = [];

  totalPrice: Subject<number> = new Subject<number>();

  totalQuantity: Subject<number> = new Subject<number>();

  constructor() { }

  addToCart(cartItem: CartItem){
    
    let alreadyExistInCart: boolean = false;
    let existingCartItem: CartItem = undefined;

    if(this.cartItems.length > 0){

      /*for(let tempCartItem of this.cartItems){

        if(tempCartItem.id == cartItem.id){
          existingCartItem = tempCartItem;
          break;
        }

      }OR*/

      //arrow function if no value found returns->undefined
      existingCartItem = this.cartItems.find(tempCartItem => tempCartItem.id == cartItem.id);
    
      alreadyExistInCart = (existingCartItem != undefined);
    }

    if(alreadyExistInCart){
      existingCartItem.quantity++;
    }else{
      //just add item to the array
      this.cartItems.push(cartItem);

    }

    //compute cart quantity and cart total
    this.computeCartTotals();


  }

  computeCartTotals() {
    let totalPriceValue: number = 0;
    let totalQuantityValue: number = 0;

    for(let currentCartItem of this.cartItems){
      totalPriceValue += currentCartItem.quantity * currentCartItem.unitPrice;
      totalQuantityValue += currentCartItem.quantity;
    }

    //publish new value to all subscribers will receive the updated data

    this.totalPrice.next(totalPriceValue);
    this.totalQuantity.next(totalQuantityValue);

    this.logCartData(totalPriceValue,totalQuantityValue);


  }
  logCartData(totalPriceValue: number, totalQuantityValue: number) {
    
    console.log("contents of the cart");
    
    for(let tempCartItem of this.cartItems){
      const subTotalPrice = tempCartItem.quantity * tempCartItem.unitPrice;
      console.log(`Name: ${tempCartItem.name}, Quantity: ${tempCartItem.quantity}, UnitPrice = ${tempCartItem.unitPrice}`);
    }

    //two digit after decimal

    console.log(`Total Price : ${totalPriceValue.toFixed(2)}, Total Quantity : ${totalQuantityValue}`);
    console.log("------------------------------------------------");


  }

  decrementQuantity(cartItem: CartItem) {
    
    cartItem.quantity--;
    if(cartItem.quantity == 0){
      this.remove(cartItem);
    }else{
      this.computeCartTotals();
    }

  }
  remove(cartItem: CartItem) {
      
    const itemIndex = this.cartItems.findIndex(tempCartItem => tempCartItem.id == cartItem.id);
    
    //items present
    if(itemIndex > -1){
      this.cartItems.splice(itemIndex,1);//delete 1 item
      this.computeCartTotals();
    }
    
  }


}
