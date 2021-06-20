import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_buddy_3/models/user.dart';
import '../../buy_sell/screens/buy_sell_page.dart';
import '../../event/screens/event_page_dashboard.dart';
import '../../profile/screens/profile_page.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isLoading = false;
  final List<Widget> _children = [
    EventPageDashboard(),
    BuySellPage(),
    ProfilePage()
  ];

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(Duration.zero)
        .then((value) => Provider.of<UserProvider>(context, listen: false)
            .fetchAndSetUser(FirebaseAuth.instance.currentUser.uid))
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? 
    Center(child: CircularProgressIndicator())
    :Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
            // _navigateToScreens(index);
          },
          backgroundColor: Color(0xFF1E1C24),
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Theme.of(context).accentColor,
          items: [
            new BottomNavigationBarItem(
                icon: _currentIndex == 0
                    ? Icon(Icons.home)
                    : Icon(Icons.home_outlined),
                label: 'Events'),
            new BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? Icon(Icons.shopping_cart)
                    : Icon(Icons.shopping_cart_outlined),
                label: 'Classified'),
            new BottomNavigationBarItem(
                icon: _currentIndex == 2
                    ? Icon(Icons.account_circle)
                    : Icon(Icons.account_circle_outlined),
                label: 'Account'),
          ]),
    );
  }
}
