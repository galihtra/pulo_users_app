import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_app/main/pasar/models/offer.dart';
import 'package:users_app/main/pasar/models/second_offer.dart';
import 'package:users_app/main/pasar/models/small_pasar.dart';
import 'package:users_app/utils/constant.dart';
import 'package:users_app/main/mart/pages/mart_details.dart';
import 'package:users_app/utils/color_resources.dart';
import 'package:users_app/utils/light_themes.dart';

class RentalPage extends StatefulWidget {
  const RentalPage({super.key});

  @override
  State<RentalPage> createState() => _PasarPageState();
}

class _PasarPageState extends State<RentalPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12, top: 25),
                child: CostumAppBarMart(screenSize: screenSize),
              ),
              SizedBox(
                height: screenSize.height * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: SearchBoxMart(screenSize: screenSize),
              ),
              SizedBox(
                height: screenSize.height * 0.027,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: const firstOffer(),
              ),
              SizedBox(
                height: screenSize.height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: offerContainer(screenSize: screenSize),
              ),
              SizedBox(
                height: screenSize.height * 0.020,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: const CategoryTitle(),
              ),
              SizedBox(
                height: screenSize.height * 0.027,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: SmallContainers(screenSize: screenSize),
              ),
              SizedBox(
                height: screenSize.height * 0.027,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: const SecondOfferTitle(),
              ),
              SizedBox(
                height: screenSize.height * 0.027,
              ),
              SecondOffer(screenSize: screenSize),
              SizedBox(
                height: screenSize.height * 0.027,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CostumAppBarMart extends StatelessWidget {
  const CostumAppBarMart({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: ColorResources.black,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
        const Expanded(child: SizedBox()),
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
    );
  }
}

class SearchBoxMart extends StatelessWidget {
  const SearchBoxMart({
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
              hintText: "Find fresh products here",
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
      height: screenSize.height * 0.3,
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: screenSize.width * 1.98,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.3,
              ),
              itemCount: smallPasarItems.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => MartDetails(
                                details: smallPasarItems[index],
                              )),
                        ),
                      );
                    }),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: screenSize.height * 0.1,
                          width: screenSize.width * 0.22,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(smallPasarItems[index].image),
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.8,
                                color: blue1,
                                offset: Offset(0.0, 0.5),
                              )
                            ],
                          ),
                        ),
                        Text(
                          smallPasarItems[index].name,
                          style: TextStyle(color: ColorResources.black),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Choose from the categories",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorResources.black,
        fontSize: 21,
      ),
    );
  }
}

class SecondOfferTitle extends StatelessWidget {
  const SecondOfferTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Exclusive for you",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorResources.black,
        fontSize: 21,
      ),
    );
  }
}

class firstOffer extends StatelessWidget {
  const firstOffer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Our gift to you",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorResources.black,
        fontSize: 21,
      ),
    );
  }
}

class offerContainer extends StatelessWidget {
  const offerContainer({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.327,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: offerItems.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: Stack(
              children: [
                InkWell(
                  onTap: (() {}),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    width: screenSize.width * 0.9,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        opacity: 0.6,
                        image: NetworkImage(
                          offerItems[index].backgroundImage,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: screenSize.width * 0.6,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(offerItems[index].image),
                            ),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(60),
                              bottomRight: Radius.circular(60),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                          child: Text(
                            offerItems[index].title,
                            style: TextStyle(
                              color: blue1,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class SecondOffer extends StatelessWidget {
  const SecondOffer({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.367,
      child: Container(
        color: blue1,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: allProductPasarItems.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(7.0),
              child: Stack(
                children: [
                  InkWell(
                    onTap: (() {}),
                    child: Container(
                      width: screenSize.width * 0.4,
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
                                fit: BoxFit.fill,
                                image:
                                    NetworkImage(smallPasarItems[index].image),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  smallPasarItems[index].name,
                                  style: TextStyle(
                                      color: blue1,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.005,
                                ),
                                Text(
                                  allProductPasarItems[index].discountPrice,
                                  style: const TextStyle(
                                      fontSize: 18.5,
                                      color: ColorResources.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.009,
                                ),
                                Text(
                                  allProductPasarItems[index].price,
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                  ),
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
      ),
    );
  }
}
