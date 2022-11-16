import 'package:contactlist/widgets/favorite_widget.dart';
import 'package:contactlist/widgets/home_widget.dart';
import 'package:contactlist/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _selectedWidget=const[
   HomeWidget(),
   FavoriteWidget(),
   ProfileWidget(),

  ];
  // static const List _widgetoption=<Widget>[
  //  HomeWidget(),
  //  FavoriteWidget(),
  //  ProfileWidget(),
  // ];
  _setIndex(int index)=>setState(() => _selectedIndex = index);
  // setIndex(int index){
  //   setState(() {
  //     _selectedIndex=index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_selectedWidget[_selectedIndex],

      appBar: AppBar(
        title: const Text("MyContacts"),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value)=>_setIndex(value),
        currentIndex: _selectedIndex,
        items: const[  
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home",
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_rounded),
          label: "Favorite",
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: "Profile",
          ),
        ],
        ),
    );
  }
}