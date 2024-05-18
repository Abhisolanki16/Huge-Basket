
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:march_27/Screens/profile_scree.dart';
import 'package:march_27/Screens/store_list.dart';
import 'package:march_27/constants.dart';

class BottomMenuScreen extends StatefulWidget {
  const BottomMenuScreen({super.key});

  @override
  State<BottomMenuScreen> createState() => _BottomMenuScreenState();
}

class _BottomMenuScreenState extends State<BottomMenuScreen> {
  int currentIndex = 0;
  int storeIndex = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.originalWhite,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  static const List<Widget> widgets = [
    StoreList(),
    Text('Order Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: widgets.elementAt(currentIndex),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            selectedItemColor: AppColors.green,
            currentIndex: currentIndex,
            backgroundColor: const Color(0xFFF0F6EE).withOpacity(0.8),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.store,
                  ),
                  label: 'Stores'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list_alt_sharp,
                  ),
                  label: 'My Orders'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile'),
            ]),
      ),
    );
  }
}
