import 'package:flutter/material.dart';
import 'package:suba_arch/home.dart';
import 'package:suba_arch/pages/dashbord.dart';
import 'package:suba_arch/pages/user.dart';


class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);
  @override
  _Navbar createState() => _Navbar();
}
class _Navbar extends State<Navbar> {
  int _SelectedIndex = 0;
  final list = [
    Home(),
    DashbordWidget(),
    UserWidget()
    
  ];
  void _onitemtap(int index) {
    setState(() {
      _SelectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // body navbar
      body: list[_SelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _SelectedIndex,
        selectedItemColor: Colors.amber[400],
          onTap: _onitemtap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Dashbord'),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle_sharp), label: 'User'),
          ]),
    );
  }
}