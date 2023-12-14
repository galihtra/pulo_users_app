import 'package:flutter/material.dart';
import 'package:users_app/pages/home_page.dart';

import '../../../models/gojek_icon.dart';
import '../../../utils/icons.dart';
import '../../../utils/light_themes.dart';

class MenusWidget extends StatelessWidget {
  const MenusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      child: GridView.count(crossAxisCount: 4, mainAxisSpacing: 8, children: [
        ...menuIcons.map(
          (icon) => GestureDetector(
            onTap: () {
              // Handle the onClick for each menu item here
              _handleMenuItemClick(context, icon);
            },
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    'assets/images/${icon.icon}.png',
                    width: 30,
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  icon.title,
                  style: regular12_5.copyWith(color: dark2),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  void _handleMenuItemClick(BuildContext context, GojekIcon icon) {
    // Navigate to different pages based on the clicked menu item
    switch (icon.icon) {
      case 'MOTOR':
        break;
      case 'MOBIL':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => const HomePage()),
        );
        break;
      case 'gofood':
        // Navigate to GoFood page
        break;
      // Add cases for other menu items as needed
      default:
        // Handle default case or navigate to a generic page
        break;
    }
  }
}
