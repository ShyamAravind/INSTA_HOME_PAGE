import 'package:flutter/material.dart';
import 'package:insta_home/home.dart';
import 'package:insta_home/insta_custom_icons_icons.dart';
import 'package:insta_home/feed.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedindex = 0;
  List pages = [HomePage(),FeedPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedindex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) => setState(() => selectedindex = index),
        items: const [
          BottomNavigationBarItem(
            label: " ",
            icon: Icon(InstaCustomIcons.icons8_home),
          ),
          BottomNavigationBarItem(
            label: " ",
            icon: Icon(InstaCustomIcons.icons8_search),
          ),
          BottomNavigationBarItem(
            label: " ",
            icon: Icon(InstaCustomIcons.icons8_plus_24),
          ),
          BottomNavigationBarItem(
            label: " ",
            icon: Icon(InstaCustomIcons.icons8_reels),
          ),
          BottomNavigationBarItem(
            label: " ",
            icon: Icon(InstaCustomIcons.icons8_account_24),
          ),
        ],
      ),
    );
  }
}
