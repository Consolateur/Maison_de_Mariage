import 'package:flutter/material.dart';
import 'meeting_screen.dart';
import 'ecommerce_screen.dart';
import 'ads_screen.dart';
import 'chat_list_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget { @override _HomeScreenState createState() => _HomeScreenState(); }
class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final _pages = [MeetingScreen(), EcommerceScreen(), AdsScreen(), ChatListScreen(), ProfileScreen()];
  @override Widget build(BuildContext ctx) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        selectedItemColor: Colors.teal,
        onTap: (i)=>setState(()=>_index=i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label:'Rencontre'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label:'E-commerce'),
          BottomNavigationBarItem(icon: Icon(Icons.campaign), label:'Publicité'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label:'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label:'Profil'),
        ],
      ),
    );
  }
}
