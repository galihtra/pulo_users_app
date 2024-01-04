import 'package:flutter/material.dart';
import 'package:users_app/main/food/pages/food_page.dart';
import 'package:users_app/main/pasar/pages/pasar_page.dart';
import 'package:users_app/main/rental/pages/rental_page.dart';
import 'package:users_app/pages/home_page.dart';

import '../../../models/gojek_icon.dart';
import '../../../utils/icons.dart';
import '../../../utils/light_themes.dart';

class MenusWidget extends StatelessWidget {
  const MenusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
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
      case 'FOOD':
        // Navigate to Food page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => const FoodPage()),
        );
        break;
      case 'MART':
        // Navigate to Mart page
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (c) => const MartPage()),
        // );
        break;
      case 'PASAR':
        // Navigate to Mart page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => const PasarPage()),
        );
        break;
      case 'BOX':
        // Navigate to Mart page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => const RentalPage()),
        );
        break;
      // Add cases for other menu items as needed
      default:
        // Handle default case or navigate to a generic page
        break;
    }
  }
}
