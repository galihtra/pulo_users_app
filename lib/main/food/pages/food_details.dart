import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:users_app/utils/color_resources.dart';
import 'package:users_app/utils/constant.dart';
import 'package:users_app/utils/light_themes.dart';

import '../../../models/seller_products.dart';

class FoodDetails extends StatefulWidget {
  final SellerProducts sellerProductsDetails;
  // final DistInfo details;
  // final DispInfo2 detail;

  const FoodDetails({
    super.key,
    required this.sellerProductsDetails,
  });

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    Size sc = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: sc.height * 0.270,
                    width: sc.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            widget.sellerProductsDetails.productImage),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: sc.height * 0.043,
                        width: sc.width * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff757283)),
                        child: Center(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.arrow_back_rounded,
                                color: ColorResources.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: sc.height * 0.043,
                        width: sc.width * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff757283)),
                        child: const Center(
                            child: Icon(
                          Icons.favorite_rounded,
                          color: ColorResources.white,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sc.height * 0.68,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, right: 12, left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: sc.height * 0.010,
                      ),
                      Text(
                        widget.sellerProductsDetails.productName,
                        style: const TextStyle(
                            fontSize: 21.5,
                            fontWeight: FontWeight.bold,
                            color: ColorResources.black),
                      ),
                      SizedBox(
                        height: sc.height * 0.010,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffFCD506),
                            size: 16,
                          ),
                          Text(
                            "9.2",
                            // widget.details.ratting,
                            style: TextStyle(
                                fontSize: 12.5, color: ColorResources.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: sc.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(
                                    widget.sellerProductsDetails.productPrice),
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: ColorResources.black),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (value > 1) {
                                    setState(() {
                                      value--;
                                    });
                                  }
                                },
                                iconSize: 16.5,
                                style: ButtonStyle(
                                  fixedSize: MaterialStatePropertyAll(
                                    Size(
                                      sc.width * 0.08,
                                      sc.height * 0.040,
                                    ),
                                  ),
                                  minimumSize: MaterialStatePropertyAll(
                                    Size(
                                      sc.width * 0.08,
                                      sc.height * 0.040,
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStatePropertyAll(blue2),
                                ),
                                icon: Icon(
                                  Icons.remove,
                                  color: ColorResources.white,
                                ),
                              ),
                              SizedBox(
                                width: sc.width * 0.04,
                              ),
                              Text(
                                value.toString(),
                                style: TextStyle(
                                  fontSize: 22,
                                  color: ColorResources.black,
                                ),
                              ),
                              SizedBox(
                                width: sc.width * 0.04,
                              ),
                              IconButton(
                                onPressed: () {
                                  if (value <
                                      widget
                                          .sellerProductsDetails.productStock) {
                                    setState(() {
                                      value++;
                                    });
                                  }
                                },
                                iconSize: 16.5,
                                style: ButtonStyle(
                                  fixedSize: MaterialStatePropertyAll(
                                    Size(
                                      sc.width * 0.08,
                                      sc.height * 0.040,
                                    ),
                                  ),
                                  minimumSize: MaterialStatePropertyAll(
                                    Size(
                                      sc.width * 0.08,
                                      sc.height * 0.040,
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStatePropertyAll(blue2),
                                ),
                                icon: Icon(
                                  Icons.add,
                                  color: ColorResources.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: sc.height * 0.006,
                      ),
                      Text(
                        widget.sellerProductsDetails.productDescription,
                        style: const TextStyle(
                          fontSize: 15,
                          color: ColorResources.black,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Center(
                          child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<SellerProducts>()
                              .addToCart(widget.sellerProductsDetails, value);
                          showDialog(
                              context: context,
                              builder: ((context) => const AlertDialog(
                                    content: Text("Berhasil ditambahkan!"),
                                  ))).then((value) {
                            Navigator.pop(context);
                            setState(() {});
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(blue2)),
                        child: const Text(
                          "Add to cart",
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorResources.white,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
