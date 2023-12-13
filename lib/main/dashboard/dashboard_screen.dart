import 'package:flutter/material.dart';
import 'package:users_app/main/history/history_screen.dart';
import 'package:users_app/main/home/home_screen.dart';
import 'package:users_app/main/message/message_screen.dart';
import 'package:users_app/main/profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int initialIndex;
  const DashboardScreen({super.key, required this.initialIndex});

  @override
  State<DashboardScreen> createState() => _HomePageState();
}

class _HomePageState extends State<DashboardScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0; 
  late List<Widget> _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  bool singleVendor = false;

  @override
  void initState() {
    super.initState();

    _pageIndex = widget.initialIndex; 
    _screens = [
      const HomeScreen(),
      const HistoryScreen(),
      const MessageScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index; 
      _setPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).textTheme.bodyLarge!.color,
        showUnselectedLabels: true,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: _getBottomWidget(singleVendor),
        onTap: _onItemTapped, 
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _screens.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _screens[index];
        },
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
    });
  }

  BottomNavigationBarItem _barItem(IconData icon, String? label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: index == _pageIndex
            ? Theme.of(context).primaryColor
            : Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.5),
        size: 25,
      ),
      label: label,
    );
  }

  List<BottomNavigationBarItem> _getBottomWidget(bool isSingleVendor) {
    List<BottomNavigationBarItem> list = [];

    if (!isSingleVendor) {
      list.add(_barItem(Icons.home, 'Home', 0));
      list.add(_barItem(Icons.history, 'Riwayat', 1));
      list.add(_barItem(Icons.message, 'Pesan', 2));
      list.add(_barItem(Icons.person, 'Akun', 3));
    } else {
      list.add(_barItem(Icons.home, 'Home', 0));
      list.add(_barItem(Icons.history, 'Riwayat', 1));
      list.add(_barItem(Icons.message, 'Pesan', 2));
      list.add(_barItem(Icons.person, 'Akun', 3));
    }

    return list;
  }
}
