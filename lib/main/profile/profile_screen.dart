import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/color_resources.dart';
import '../../utils/custom_themes.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../widgets/animated_custom_dialog.dart';
import 'widgets/sign_out_confirmation_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String userName = '';

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    DatabaseReference usersRef = FirebaseDatabase.instance
        .reference()
        .child("users")
        .child(FirebaseAuth.instance.currentUser!.uid);

    await usersRef.once().then((snap) {
      if (snap.snapshot.value != null) {
        if ((snap.snapshot.value as Map)["blockStatus"] == "no") {
          setState(() {
            userName = (snap.snapshot.value as Map)["name"];
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            Images.morePageHeader,
            height: 150,
            fit: BoxFit.fill,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Positioned(
          top: 40,
          left: Dimensions.paddingSizeSmall,
          right: Dimensions.paddingSizeSmall,
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
              child: Image.asset(Images.logoWithNameImageWhite, height: 25),
            ),
            const Expanded(child: SizedBox.shrink()),
            InkWell(
              onTap: () {},
              child: Row(children: [
                Text(userName,
                    style: titilliumRegular.copyWith(
                        color: ColorResources.white, fontSize: 16)),
                const SizedBox(width: Dimensions.paddingSizeSmall),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage.assetNetwork(
                    placeholder: Images.placeholder,
                    width: 35,
                    height: 35,
                    fit: BoxFit.fill,
                    image: '',
                    imageErrorBuilder: (c, o, s) => CircleAvatar(
                        child: Image.asset("assets/images/avatarman.png")),
                  ),
                ),
              ]),
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.only(top: 120),
          decoration: BoxDecoration(
            color: ColorResources.getIconBg(context),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: Dimensions.paddingSizeLarge),
                  const TitleButton(
                      image: Images.helpCenter,
                      title: 'FAQ',
                      navigateTo: SizedBox()),
                  const TitleButton(
                      image: Images.aboutUs,
                      title: 'About Us',
                      navigateTo: SizedBox()),
                  const TitleButton(
                      image: Images.contactUs,
                      title: 'Contact Us',
                      navigateTo: SizedBox()),
                  const TitleButton(
                      image: Images.termCondition,
                      title: 'Term & Condition',
                      navigateTo: SizedBox()),
                  const TitleButton(
                      image: Images.privacyPolicy,
                      title: 'Privacy Policy',
                      navigateTo: SizedBox()),
                  ListTile(
                    leading: Icon(
                      Icons.info_rounded,
                      color: ColorResources.getPrimary(context),
                      size: 25,
                    ),
                    title: Text('App Info',
                        style: titilliumRegular.copyWith(
                            fontSize: Dimensions.fontSizeLarge)),
                    trailing: const Text('1.0.0'),
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app,
                        color: ColorResources.getPrimary(context), size: 25),
                    title: Text('Sign Out',
                        style: titilliumRegular.copyWith(
                            fontSize: Dimensions.fontSizeLarge)),
                    onTap: () => showAnimatedDialog(
                        context, const SignOutConfirmationDialog(),
                        isFlip: true),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}

class SquareButton extends StatelessWidget {
  final String image;
  final String? title;
  final Widget navigateTo;
  final int count;
  final bool hasCount;

  const SquareButton(
      {Key? key,
      required this.image,
      required this.title,
      required this.navigateTo,
      required this.count,
      required this.hasCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 100;
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => navigateTo)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width / 4,
            height: width / 4,
            padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorResources.getPrimary(context),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(image, color: Theme.of(context).highlightColor),
                hasCount
                    ? Positioned(
                        top: -4,
                        right: -4,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: ColorResources.red,
                          child: Text(count.toString(),
                              style: titilliumSemiBold.copyWith(
                                color: Theme.of(context).cardColor,
                                fontSize: Dimensions.fontSizeExtraSmall,
                              )),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
        Flexible(
          child: Text(title!,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: titilliumRegular.copyWith(
                  fontSize: Dimensions.fontSizeDefault)),
        ),
      ]),
    );
  }
}

class TitleButton extends StatelessWidget {
  final String image;
  final String? title;
  final Widget navigateTo;
  const TitleButton(
      {Key? key,
      required this.image,
      required this.title,
      required this.navigateTo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image, width: 25, height: 25, fit: BoxFit.fill),
      title: Text(title!,
          style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => navigateTo),
      ),
    );
  }
}
