import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:users_app/models/seller_products.dart';
import 'package:users_app/utils/color_resources.dart';
import 'package:users_app/utils/constant.dart';
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
    Size sc = Utils().getScreenSize();
    return Consumer<SellerProducts>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorResources.getHomeBg(context),
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

                        /// get item's image
                        final String itemImage = cartItems.productImage;

                        /// return list tile
                        return Container(
                          decoration: BoxDecoration(
                              color: ColorResources.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.8,
                                  color: blue1,
                                  offset: const Offset(0.0, 0.5),
                                )
                              ]),
                          margin: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          child: ListTile(
                            leading: Container(
                              width: sc.width * 0.13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(itemImage),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            title: Text(
                              itemName,
                              style: const TextStyle(
                                color: ColorResources.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              itemPrice,
                              style: const TextStyle(
                                color: ColorResources.black,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                removeFromCart(cartItems, context);
                                getAllItemPrice(context);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: ColorResources.black,
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
                          backgroundColor:
                              MaterialStatePropertyAll(light.primaryColor),
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
