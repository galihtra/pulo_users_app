// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class SellerProducts extends ChangeNotifier {
  String productId;
  String sellerId;
  String productCategory;
  String productDescription;
  String productImage;
  String productName;
  int productPrice;
  int productStock;

  SellerProducts({
    this.productId = "",
    this.sellerId = "",
    this.productCategory = "",
    this.productDescription = "",
    this.productImage = "",
    this.productName = "",
    this.productPrice = 0,
    this.productStock = 0,
  });

  /// seller products
  List<SellerProducts> _sellerProducts = [];

  /// getter methods
  List<SellerProducts> get sellerProducts => _sellerProducts;
}
