import 'package:flutter/material.dart';
import 'package:nutrify/screens/home_screen.dart';

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
        appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: c_index,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withAlpha(100),
          onTap: ((value) {
            setState(() {
              c_index = value;
            });
          }),
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    Icons.home,
                    size: 28,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  CircleAvatar(
                    radius: c_index == 0 ? 4 : 0,
                  )
                ],
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    Icons.search,
                    size: 28,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  CircleAvatar(
                    radius: c_index == 1 ? 4 : 0,
                  )
                ],
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent[100],
                    borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.qr_code_scanner),
              ),
              label: 'qr_code',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    Icons.bar_chart,
                    size: 28,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  CircleAvatar(
                    radius: c_index == 3 ? 4 : 0,
                  )
                ],
              ),
              label: 'bar_char',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    Icons.person,
                    size: 28,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  CircleAvatar(
                    radius: c_index == 4 ? 4 : 0,
                  )
                ],
              ),
              label: 'person',
            ),
          ],
        ),
        body: screens[c_index]);
  }
}
