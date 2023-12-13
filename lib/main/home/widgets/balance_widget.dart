import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/icons.dart';
import '../../../utils/light_themes.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      decoration:
          BoxDecoration(color: blue1, borderRadius: BorderRadius.circular(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Rp12.379',
                    style: bold18.copyWith(color: dark1),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Klik & cek riwayat',
                    style: semibold12_5.copyWith(color: blue1),
                  ),
                ],
              ),
            ),
          ),
          ...gopayIcons.map((icon) => Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset(
                        'assets/icons/${icon.icon}.svg',
                        color: blue1,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      icon.title,
                      style: semibold14.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
