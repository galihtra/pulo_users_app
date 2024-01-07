import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:users_app/models/seller_products.dart';
import 'package:users_app/utils/color_resources.dart';
import 'package:users_app/utils/light_themes.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int allItemPrice = 0;
  String allItemPriceFormat = "0";

  /// remove from cart
  void removeFromCart(SellerProducts cartItem, BuildContext context) {
    /// get access to cart
    final sellerProducts = context.read<SellerProducts>();

    /// remove the item
    sellerProducts.removeFromCart(cartItem);
  }

  /// get all item's price
  void getAllItemPrice(BuildContext context) {
    final sellerProducts = context.read<SellerProducts>();
    allItemPrice = 0;
    for (var i = 0; i < sellerProducts.cart.length; i++) {
      allItemPrice += sellerProducts.cart[i].productPrice;
    }

    allItemPriceFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(
      allItemPrice,
    );
  }

  @override
  Widget build(BuildContext context) {
    getAllItemPrice(context);
    return Consumer<SellerProducts>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("My Cart",
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: value.cart.isEmpty
            ? const Center(
                child: Text(
                  "Tidak ada produk\ndi keranjang",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              )
            : Column(
                children: [
                  /// Costumer's Cart
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.cart.length,
                      itemBuilder: (context, index) {
                        /// get items from cart
                        final SellerProducts cartItems = value.cart[index];

                        /// get item's name
                        final String itemName = cartItems.productName;

                        /// get item's price
                        final String itemPrice = NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(
                          cartItems.productPrice,
                        );

                        /// return list tile
                        return Container(
                          decoration: BoxDecoration(
                            color: blue2,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          child: ListTile(
                            title: Text(
                              itemName,
                              style: const TextStyle(
                                color: ColorResources.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              itemPrice,
                              style: const TextStyle(
                                color: ColorResources.grey,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                removeFromCart(cartItems, context);
                                getAllItemPrice(context);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: ColorResources.grey,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  /// Checkout Button
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(blue2),
                          foregroundColor: const MaterialStatePropertyAll(
                              ColorResources.white)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Checkout"),
                          Text(
                            "| $allItemPriceFormat",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
