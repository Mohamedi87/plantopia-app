import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantopia/constants/constants.dart';
import 'package:plantopia/models/plants.dart';
import 'package:plantopia/ui/screens/scan_page.dart';
import 'package:plantopia/ui/screens/cart_page.dart';
import 'package:plantopia/ui/screens/favorite_page.dart';
import 'package:plantopia/ui/screens/home_page.dart';
import 'package:plantopia/ui/screens/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];

  int _bottomNavIndex = 0;

  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      FavoritePage(favoritesPlants: favorites),
      CartPage(addedToCartPlants: myCart),
      const ProfilePage()
    ];
  }

  //
  List<IconData> iconList = const [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person
  ];
  //
  List<String> titleList = const ['Home', 'Favorite', 'Cart', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                  color: Constants.blackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 24),
            ),
            Icon(
              Icons.notifications,
              color: Constants.blackColor,
              size: 30.0,
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: Constants.primaryColor,
            width: 2.0,
          ),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                child: const ScanPage(),
                type: PageTransitionType.bottomToTop,
              ),
            );
          },
          icon: Image.asset(
            'assets/images/code-scan-two.png',
            height: 30.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.7),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
            final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

            favorites = favoritedPlants;
            myCart = addedToCartPlants.toSet().toList();
          });
        },
      ),
    );
  }
}
