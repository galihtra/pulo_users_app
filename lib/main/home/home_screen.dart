import 'package:flutter/material.dart';
import 'package:users_app/main/home/widgets/balance_widget.dart';
import 'package:users_app/main/home/widgets/banner_widget.dart';
import 'package:users_app/main/home/widgets/content_widget.dart';
import 'package:users_app/main/home/widgets/menus_widget.dart';

import '../../utils/color_resources.dart';
import '../../utils/custom_themes.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/light_themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true, // Added snap property
                  elevation: 0,
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).highlightColor,
                  title: Image.asset(
                    Images.logoWithNameImage,
                    height: 35,
                    color: const Color(0xFF1455AC),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              Images.cartArrowDownImage,
                              height: Dimensions.iconSizeDefault,
                              width: Dimensions.iconSizeDefault,
                              color: ColorResources.getPrimary(context),
                            ),
                            Positioned(
                              top: -4,
                              right: -4,
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: ColorResources.red,
                                child: Text(
                                  '10',
                                  style: titilliumSemiBold.copyWith(
                                    color: ColorResources.white,
                                    fontSize: Dimensions.fontSizeExtraSmall,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverDelegate(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.homePagePadding,
                          vertical: Dimensions.paddingSizeSmall,
                        ),
                        color: ColorResources.getHomeBg(context),
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: Dimensions.homePagePadding,
                            right: Dimensions.paddingSizeExtraSmall,
                            top: Dimensions.paddingSizeExtraSmall,
                            bottom: Dimensions.paddingSizeExtraSmall,
                          ),
                          height: 60,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[200]!,
                                spreadRadius: 1,
                                blurRadius: 1,
                              )
                            ],
                            borderRadius: BorderRadius.circular(
                              Dimensions.paddingSizeExtraSmall,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: robotoRegular.copyWith(
                                      color: Theme.of(context).hintColor,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: robotoRegular.copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Handle search icon
                                  String searchTerm = searchController.text;
                                  print('Search term: $searchTerm');
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        Dimensions.paddingSizeExtraSmall,
                                      ),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Theme.of(context).cardColor,
                                    size: Dimensions.iconSizeSmall,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      Dimensions.homePagePadding,
                      Dimensions.paddingSizeSmall,
                      Dimensions.paddingSizeDefault,
                      Dimensions.paddingSizeSmall,
                    ),
                    child: Column(
                      children: [
                        const BannerWidget(),
                        const SizedBox(height: Dimensions.homePagePadding),
                        const BalanceWidget(),
                        const SizedBox(height: Dimensions.homePagePadding),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Our Services",
                              style: regular16.copyWith(color: dark2),
                            ),
                          ),
                        ),
                        const SizedBox(height: Dimensions.homePagePadding),
                        const MenusWidget(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Content for You",
                              style: regular16.copyWith(color: dark2),
                            ),
                          ),
                        ),
                        const ContentWidget(),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.5 / 2,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        // return const ProductItemWidget();
                      },
                      childCount: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => 130; // Adjusted maxExtent

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 130 ||
        oldDelegate.minExtent != 70 ||
        child != oldDelegate.child;
  }
}
