import 'package:blinqpay/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../views/profile_view.dart';
import '../views/search_view.dart';

class BottomTab extends StatefulWidget {
  final int currentIndex;

  const BottomTab({Key? key, this.currentIndex = 0}) : super(key: key);
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _currentIndex = 0;

  final List<Map<String, dynamic>> _children = [];

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    _children.add({"title": "Home", "widget": HomeView()});
    _children.add({"title": "Search", "widget": SearchView()});
    _children.add({"title": "Profile", "widget": ProfileView()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          HapticFeedback.selectionClick();
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: theme.textTheme.bodyMedium,
        unselectedLabelStyle: theme.textTheme.bodyMedium,
        elevation: 2,
        selectedItemColor: primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("$assetPath/home.svg",
                color: _currentIndex == 0 ? primaryColor : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "$assetPath/search.svg",
              color: _currentIndex == 1 ? primaryColor : Colors.grey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("$assetPath/profile.svg",
                color: _currentIndex == 2 ? primaryColor : Colors.grey),
            label: 'Profle',
          ),
        ],
      ),
      body: _children.length >= 2
          ? _children[_currentIndex]['widget']
          : Container(),
    );
  }
}
