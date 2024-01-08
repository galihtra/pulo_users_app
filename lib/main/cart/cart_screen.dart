import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:users_app/main/payment/payment.dart';
import 'package:users_app/models/user_cart.dart';
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
  void removeFromCart(UserCart cartItem, BuildContext context) {
    /// get access to cart
    final userCart = context.read<UserCart>();

    /// remove the item
    userCart.removeFromCart(cartItem);
  }

  /// get all item's price
  void getAllItemPrice(BuildContext context) {
    final userCart = context.read<UserCart>();
    allItemPrice = 0;
    for (var i = 0; i < userCart.cart.length; i++) {
      allItemPrice += userCart.cart[i].productPrice;
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
    return Consumer<UserCart>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorResources.getHomeBg(context),
          title: const Text(
            "Keranjang",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: value.cart.length,
                      itemBuilder: (context, index) {
                        /// get items from cart
                        final UserCart cartItems = value.cart[index];

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
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                            left: 15.0,
                            right: 15.0,
                          ),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            width: sc.width * 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorResources.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.8,
                                  color: blue1,
                                  offset: Offset(0.0, 0.5),
                                )
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// gambar produk
                                Container(
                                  height: sc.height * 0.1,
                                  width: sc.width * 0.2,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(itemImage),
                                    ),
                                  ),
                                ),

                                /// nama dan harga
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        itemName,
                                        style: TextStyle(
                                            color: blue1,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: sc.height * 0.005,
                                      ),
                                      Text(
                                        itemPrice,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: ColorResources.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(child: SizedBox()),

                                /// tombol jumlah item
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: sc.height * 0.02,
                                      horizontal: sc.width * 0.01),
                                  child: IconButton(
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
                              ],
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
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  Payment(allItemPrice: allItemPrice)))),
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
