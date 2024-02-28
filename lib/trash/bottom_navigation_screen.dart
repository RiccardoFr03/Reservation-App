

/*
import 'package:cloud_craft_solution/ui/screens/home_screen.dart';
import 'package:cloud_craft_solution/ui/screens/reservation_screen.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  bool showBottomNavigationBar = true;
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const ReservationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: (isOpen) {
        setState(() {
          showBottomNavigationBar = !showBottomNavigationBar;
        });
      },
      appBar: _selectedIndex == 0 ? _appBarHome(context) : null,
      drawer: _selectedIndex == 0 ? _drawerHome(context) : null,
      bottomNavigationBar: Visibility(
        visible: showBottomNavigationBar,
        child: MyBottomNavigationBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }


  AppBar _appBarHome(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Builder(
              builder: (context) => GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(24)),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Riccardo Ferrero",
                  style: bold_16,
                ),
                Text(
                  "Bentornato!",
                  style: semibold_14,
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer _drawerHome(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home'),
            selected: _selectedIndex == 0,
          ),
          ListTile(
            title: const Text('Business'),
            selected: _selectedIndex == 1,
          ),
          ListTile(
            title: const Text('School'),
            selected: _selectedIndex == 2,
          ),
        ],
      ),
    );
  }
}
*/