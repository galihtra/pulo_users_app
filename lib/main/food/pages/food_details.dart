import 'package:flutter/material.dart';
import 'package:users_app/utils/color_resources.dart';
import 'package:users_app/utils/constant.dart';
import 'package:users_app/utils/light_themes.dart';

import '../models/seller_products.dart';

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
  int? _value = 1;

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
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 12, left: 12),
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
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFCD506),
                          size: 16,
                        ),
                        Text(
                          "9.2",
                          // widget.details.ratting,
                          style: const TextStyle(
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
                          widget.sellerProductsDetails.productPrice,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorResources.black),
                        ),
                        Row(
                          children: [
                            Container(
                              height: sc.height * 0.050,
                              width: sc.width * 0.08,
                              decoration: BoxDecoration(
                                  color: blue2, shape: BoxShape.circle),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  color: ColorResources.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: sc.width * 0.04,
                            ),
                            const Text(
                              "1",
                              style: TextStyle(
                                fontSize: 22,
                                color: ColorResources.black,
                              ),
                            ),
                            SizedBox(
                              width: sc.width * 0.04,
                            ),
                            Container(
                              height: sc.height * 0.050,
                              width: sc.width * 0.08,
                              decoration: BoxDecoration(
                                  color: blue2, shape: BoxShape.circle),
                              child: const Center(
                                  child: Icon(
                                Icons.add,
                                color: ColorResources.white,
                              )),
                            )
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
                    SizedBox(
                      height: sc.height * 0.015,
                    ),
                    const Text(
                      "Choose Additive",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ColorResources.black,
                      ),
                    ),
                    SizedBox(
                      height: sc.height * 0.01,
                    ),
                    Row(
                      children: [
                        Container(
                          height: sc.height * 0.080,
                          width: sc.width * 0.15,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/images/creamcheese.png"),
                              ),
                              color: Color(0xff3A3843),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: sc.width * 0.03,
                        ),
                        const Text(
                          "Cream Cheese",
                          style: TextStyle(
                              color: ColorResources.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: sc.width * 0.22,
                        ),
                        Row(
                          children: [
                            const Text(
                              "\$${10}",
                              style: TextStyle(
                                  color: ColorResources.black, fontSize: 16),
                            ),
                            Radio(
                                value: 1,
                                groupValue: _value,
                                onChanged: (int? value) {
                                  setState(() {
                                    _value = value!;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sc.height * 0.015,
                    ),
                    Row(
                      children: [
                        Container(
                          height: sc.height * 0.080,
                          width: sc.width * 0.15,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/avocado.png"),
                              ),
                              color: Color(0xff3A3843),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: sc.width * 0.03,
                        ),
                        const Text(
                          "Avocado",
                          style: TextStyle(
                              color: ColorResources.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: sc.width * 0.328,
                        ),
                        Row(
                          children: [
                            const Text(
                              "\$${11}",
                              style: TextStyle(
                                  color: ColorResources.black, fontSize: 16),
                            ),
                            Radio(
                                value: 2,
                                groupValue: _value,
                                onChanged: (int? value) {
                                  setState(() {
                                    _value = value!;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sc.height * 0.015,
                    ),
                    Row(
                      children: [
                        Container(
                          height: sc.height * 0.080,
                          width: sc.width * 0.15,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/9/9d/Tomato.png"),
                              ),
                              color: Color(0xff3A3843),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: sc.width * 0.0305,
                        ),
                        const Text(
                          "Tomato",
                          style: TextStyle(
                              color: ColorResources.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: sc.width * 0.35,
                        ),
                        Row(
                          children: [
                            const Text(
                              "\$${13}",
                              style: TextStyle(
                                  color: ColorResources.black, fontSize: 16),
                            ),
                            Radio(
                                value: 3,
                                groupValue: _value,
                                onChanged: (int? value) {
                                  setState(() {
                                    _value = value!;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sc.height * 0.015,
                    ),
                    Center(
                      child: Container(
                        height: sc.height * 0.06,
                        width: sc.width * 0.75,
                        decoration: BoxDecoration(
                          color: blue2,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Add to card",
                            style: TextStyle(
                              fontSize: 18,
                              color: ColorResources.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
