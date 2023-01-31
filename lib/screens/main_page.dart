import 'package:flutter/material.dart';
import 'package:nutrify/screens/home_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int c_index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      const Center(child: Text("will replace with screen latter 2")),
      const Center(child: Text("will replace with screen latter 3")),
      const Center(child: Text("will replace with screen latter 4")),
      const Center(child: Text("will replace with screen latter 5")),
    ];
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Nutrify",
            style: TextStyle(color: Colors.black),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.calendar_today_outlined,
                color: Colors.black,
              ),
            )
          ],
        ),
        bottomNavigationBar: DotNavigationBar(
          currentIndex: c_index,
          marginR: const EdgeInsets.symmetric(vertical: 20, horizontal: 48),
          selectedItemColor: Colors.black,
          borderRadius: 20,
          enablePaddingAnimation: false,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          unselectedItemColor: Colors.black.withAlpha(100),
          onTap: ((value) {
            setState(() {
              c_index = value;
            });
          }),
          items: [
            DotNavigationBarItem(
              icon: const Icon(
                Icons.home,
                size: 28,
              ),
              // label: 'Home',
            ),
            DotNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 28,
              ),
              // label: 'Search',
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.qr_code_scanner),
              // label: 'qr_code',
            ),
            DotNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    Icons.bar_chart,
                    size: 28,
                  ),
                ],
              ),
              //label: 'bar_char',
            ),
          ],
        ),
        body: screens[c_index]);
  }
}
