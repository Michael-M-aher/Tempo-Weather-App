import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../config/colors.dart';
import 'weather_data.dart';
import 'settings_screen.dart';

class MainScreen extends StatefulWidget {
  final int selectedIndex;

  const MainScreen({super.key, required this.selectedIndex});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 4;
  static const List<Widget> widgetOptions = <Widget>[
    WeatherDataScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.myDark,
        body: Center(
          child: widgetOptions.elementAt(
              selectedIndex == 4 ? widget.selectedIndex : selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bars),
              label: 'Settings',
            ),
          ],
          currentIndex:
              selectedIndex == 4 ? widget.selectedIndex : selectedIndex,
          selectedItemColor: AppColors.mycyan,
          unselectedItemColor: Colors.grey[800],
          showUnselectedLabels: false,
          backgroundColor: AppColors.myDark,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
