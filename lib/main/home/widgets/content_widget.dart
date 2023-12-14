import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_app/main/home/contents/mitra_registration_form.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({super.key});

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  /// List of Tab Bar Item
  List<String> items = [
    "Mitra Terdekat",
    "Produk Terbaru",
    "Pendaftaran",
    "Pengaduan",
  ];

  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          /// Tab Bar
          SizedBox(
            width: double.infinity,
            height: 70,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                          pageController.animateToPage(
                            current,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          width: 140,
                          height: 55,
                          decoration: BoxDecoration(
                            color: current == index
                                ? Colors.white70
                                : Colors.white54,
                            borderRadius: current == index
                                ? BorderRadius.circular(12)
                                : BorderRadius.circular(7),
                            border: current == index
                                ? Border.all(
                                    color: const Color(0xFF1455AC), width: 2.5)
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w500,
                                color: current == index
                                    ? Colors.black
                                    : Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: current == index,
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              shape: BoxShape.circle),
                        ),
                      )
                    ],
                  );
                }),
          ),

          /// MAIN BODY
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 100,
            child: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (index != 2) // Index 2 corresponds to "Pendaftaran"
                      Text(
                        "${items[index]} Tab Content",
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    if (index == 2) // Index 2 corresponds to "Pendaftaran"
                      // Card(
                      //   elevation: 5,
                      //   margin: const EdgeInsets.all(20),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(16.0),
                      //     child: Text(
                      //       "Pendaftaran Mitra",
                      //       style: GoogleFonts.ubuntu(
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 20,
                      //         color: Colors.black,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MitraRegistration()),
                          );
                        },
                        child: const Text('Formulir Pendaftaran Mitra'),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
