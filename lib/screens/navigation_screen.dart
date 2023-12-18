import 'package:flutter/material.dart';
import 'package:rhhs_app/screens/clubs_screen.dart';
import 'package:rhhs_app/screens/events_screen.dart';
import 'package:rhhs_app/screens/home_screen.dart';
import 'package:rhhs_app/screens/resources_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    EventsScreen(),
    ClubsScreen(),
    ResourcesScreen(),
  ];

  static const List<Widget> _appBars = <Widget>[
    HomeScreenAppBar(),
    EventsScreenAppBar(),
    ClubsScreenAppBar(),
    ResourcesScreenAppBar(),
  ];

  void _onItemTapped(int index) {
    if (index > _screens.length) {
      throw ArgumentError(
        "index ($index) exceeds the amount of screens (${_screens.length})",
      );
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBars.elementAt(_selectedIndex) // TODO: Make this dynamic
      ),
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: "Events",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Clubs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link),
            label: "Resources",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onBackground,
        onTap: _onItemTapped,
      ),
    );
  }
}
