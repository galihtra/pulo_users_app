import 'package:flutter/material.dart';
import 'package:users_app/main/makanan/models/bigcontainermodel.dart';
import 'package:users_app/main/makanan/models/smallcontainermodel.dart';
import 'package:users_app/main/makanan/pages/food_details.dart';
import 'package:users_app/main/makanan/utils/constant.dart';
import 'package:users_app/utils/color_resources.dart';
import 'package:users_app/utils/light_themes.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => FoodPageState();
}

class FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: screenSize.height * 0.065,
                        width: screenSize.width * 0.115,
                        decoration: BoxDecoration(
                            color: ColorResources.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: blue1,
                                blurRadius: 0.5,
                              )
                            ]),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.clear_rounded,
                            color: ColorResources.black,
                          ),
                        )),
                    Column(
                      children: [
                        const Text(
                          "Deliver to",
                          style: TextStyle(
                              color: ColorResources.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.002,
                        ),
                        Text(
                          "02-075 Konstructorska 9",
                          style: TextStyle(
                            color: blue1,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: screenSize.height * 0.065,
                      width: screenSize.width * 0.115,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz-LJaTp0HFRT2GHznf3n7iSAzu-z7och7Vc0GsJkTHWEk67OjQ0t0o6piSTpTv9sr7UI&usqp=CAU")),
                          color: blue1,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                const Text(
                  "What would you like\nto order",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorResources.black,
                    fontSize: 21,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.027,
                ),
                SearchBoxFood(screenSize: screenSize),
                SizedBox(
                  height: screenSize.height * 0.027,
                ),
                SmallContainers(screenSize: screenSize),
                SizedBox(
                  height: screenSize.height * 0.015,
                ),
                const BigContainersTitle(),
                SizedBox(
                  height: screenSize.height * 0.020,
                ),
                BigContainersFood(screenSize: screenSize),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBoxFood extends StatelessWidget {
  const SearchBoxFood({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: screenSize.height * 0.065,
          width: screenSize.width * 0.938,
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: blue1,
              ),
              hintText: "Find for restaurant or food...",
              hintStyle: const TextStyle(color: Colors.black54),
              fillColor: Colors.white70,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SmallContainers extends StatelessWidget {
  const SmallContainers({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.185,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: smallcon.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => DetailScreen(
                          details: smallcon[index],
                          detail: BigCon[index],
                        )),
                  ),
                );
              }),
              child: Container(
                width: screenSize.width * 0.22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.8,
                      color: blue1,
                      offset: Offset(0.0, 0.5),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Container(
                        height: screenSize.height * 0.1,
                        width: screenSize.width * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(smallcon[index].image)),
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      Text(
                        smallcon[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class BigContainersTitle extends StatelessWidget {
  const BigContainersTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Fastest delivery",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorResources.black,
        fontSize: 21,
      ),
    );
  }
}

class BigContainersFood extends StatelessWidget {
  const BigContainersFood({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.357,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: BigCon.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: Stack(
              children: [
                InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => DetailScreen(
                              details: smallcon[index],
                              detail: BigCon[index],
                            )),
                      ),
                    );
                  }),
                  child: Container(
                    width: screenSize.width * 0.65,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: screenSize.height * 0.19,
                          width: screenSize.width * 0.65,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(BigCon[index].image),
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    BigCon[index].name,
                                    style: TextStyle(
                                        color: blue1,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.alarm,
                                        size: 16,
                                        color: ColorResources.black,
                                      ),
                                      Text(
                                        BigCon[index].time,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: ColorResources.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenSize.height * 0.005,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xffFCD506),
                                    size: 16,
                                  ),
                                  Text(
                                    BigCon[index].ratting,
                                    style: const TextStyle(
                                        fontSize: 14.5,
                                        color: ColorResources.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenSize.height * 0.009,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: blue2),
                                    height: screenSize.height * 0.045,
                                    width: screenSize.width * 0.2,
                                    child: const Center(
                                      child: Text(
                                        "Fastfood",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: ColorResources.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.025,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: blue2),
                                    height: screenSize.height * 0.045,
                                    width: screenSize.width * 0.2,
                                    child: const Center(
                                      child: Text(
                                        "Chicken",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: ColorResources.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.025,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: blue2),
                                    height: screenSize.height * 0.045,
                                    width: screenSize.width * 0.12,
                                    child: const Center(
                                      child: Text(
                                        "Fries",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: ColorResources.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  right: 0,
                  child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.favorite_rounded,
                        size: 25,
                        color: ColorResources.white,
                      )),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
