import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_app/global/global_var.dart';
import 'package:users_app/models/seller_products.dart';

import '../../utils/color_resources.dart';

class Payment extends StatefulWidget {
  final int allItemPrice;
  const Payment({super.key, required this.allItemPrice});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    DatabaseReference usersRef = FirebaseDatabase.instance
        .ref()
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
    return Consumer<SellerProducts>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: ColorResources.getHomeBg(context),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: ColorResources.getHomeBg(context),
                title: const Text("Pembayaran",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  /// container lokasi
                  Container(
                    // padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 20),
                        const Icon(
                          Icons.location_on,
                          size: 50,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "02-075 Konstructorska 9",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  /// list produk yang akan dibayar

                  /// tombol pembayaran
                ],
              ),
            ));
  }
}
