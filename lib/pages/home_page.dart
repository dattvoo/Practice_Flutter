import 'package:ecommerce_app/components/bottom_navbar.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variable

  // Selected index is to control the bottom nav bar
  int _seletedIndex = 0;
  // Method
  void navigatorBottomBar(int index) {
    setState(() {
      _seletedIndex = index;
    });
  }

  // Pages to display
  final List<Widget> _pages = [
    // Shop page
    const ShopPage(),
    // Cart Page
    const CartPage(),
  ];
  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 158, 158),
      bottomNavigationBar:
          BottomNavbar(onTabChange: (index) => navigatorBottomBar(index)),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          );
        }),
      ),
      drawer: Drawer(
          backgroundColor: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // logo
                  DrawerHeader(
                      child: Image.asset(
                    "lib/images/logo-nike.png",
                    color: Colors.white,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Divider(color: Colors.grey[800]),
                  ),
                  // Other Page
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text(
                        "About",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, bottom: 24),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )),
      body: _pages[_seletedIndex],
    );
  }
}
