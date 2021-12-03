/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Duy
 */
public class Cart {

    private Map<String, Book> cart;

    public Cart(Map<String, Book> cart) {
        this.cart = cart;
    }

    public Cart() {
    }

    public Map<String, Book> getCart() {
        return cart;
    }

    public void setCart(Map<String, Book> cart) {
        this.cart = cart;
    }

    public void add(Book book) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(book.getProductID())) {
            int currentQuantity = this.cart.get(book.getProductID()).getQuantity();
            book.setQuantity(currentQuantity + book.getQuantity());
        }
        cart.put(book.getProductID(), book);
    }

    public void delete(String id) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }

    }
    
    public int getCartAmountProduct(){
        int amount = 0;
        for (Book b: this.cart.values()){
            amount+= b.getQuantity();
        }
        return amount;
    }
    
    public int getCartTotalPrice(){
        int total = 0;
        for (Book b: this.cart.values()){
            total+= (b.getPrice()*b.getQuantity());
        }
        return total;
    }
    
    public void update(Book newBook){
        if (this.cart==null) return;
        if(this.cart.containsKey(newBook.getProductID())){
            this.cart.replace(newBook.getProductID(), newBook);
        }
    }

}
