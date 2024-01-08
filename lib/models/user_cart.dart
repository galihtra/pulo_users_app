// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:users_app/models/seller_products.dart';

class UserCart extends ChangeNotifier {
  String productId;
  String sellerId;
  String productCategory;
  String productDescription;
  String productImage;
  String productName;
  int productPrice;
  int quantity;

  UserCart({
    this.productId = "",
    this.sellerId = "",
    this.productCategory = "",
    this.productDescription = "",
    this.productImage = "",
    this.productName = "",
    this.productPrice = 0,
    this.quantity = 0,
  });

  /// user's cart
  List<UserCart> _cart = [];

  /// getter method
  List<UserCart> get cart => _cart;

  /// add to cart method
  void addToCart(SellerProducts item, int quantity) {
    _cart.add(
      UserCart(
        productCategory: item.productCategory,
        productDescription: item.productDescription,
        productId: item.productId,
        productImage: item.productImage,
        productName: item.productName,
        productPrice: item.productPrice,
        sellerId: item.sellerId,
        quantity: quantity,
      ),
    );
    notifyListeners();
  }

  /// remove from cart method
  void removeFromCart(UserCart item) {
    _cart.remove(item);
    notifyListeners();
  }
}
