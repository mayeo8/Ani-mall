import 'package:ani_mall/components/alert_box.dart';
import 'package:ani_mall/components/icon_tab_widget.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/provider_data.dart';
import 'package:ani_mall/screens/tabs/cart_tab.dart';
import 'package:ani_mall/screens/tabs/home_tab.dart';
import 'package:ani_mall/screens/tabs/offer_screen.dart';
import 'package:ani_mall/screens/tabs/profile_screen.dart';
import 'package:ani_mall/screens/tabs/search_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.name, this.token}) : super(key: key);
  static String id = 'home_screen';
  final String? name;
  final String? token;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _activeIndex = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.token == 'create_account') {
        _alert();
      } else if (widget.token == 'login_screen') {
        const snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: kGreenButtonColor,
          content: Text(
            'Login Successful',
            style: kFontFamily,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
    _tabController = TabController(
      vsync: this,
      length: 5,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  _alert() {
    showDialog<String>(
      context: context,
      builder: (context) {
        return AlertBox(
          heading: 'Thank you for For opening an account with us',
          message:
              'We sent a mail to your email, please go there and confirm your email',
          onPress: () {
            Navigator.pop(context);
          },
          buttonText: 'Home',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      if (_tabController.indexIsChanging || _tabController.animation != null) {
        setState(() {
          _activeIndex = _tabController.index;
        });
      }
    });
    return Scaffold(
      bottomNavigationBar: Material(
        color: Provider.of<ThemeProvider>(context).isDarkMode
            ? const Color(0xff5B5B5B)
            : const Color.fromRGBO(249, 249, 249, 0.94),
        child: TabBar(
          controller: _tabController,
          // indicatorColor: kBackgroundGreenColor,
          indicator: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: kGreenButtonColor,
                width: 3.0,
              ),
            ),
          ),
          tabs: [
            Tab(
              icon: IconWidget(
                activeIndex: _activeIndex,
                index: 0,
                url: 'images/icons/icons8-house-50.png',
              ),
              iconMargin: const EdgeInsets.all(0.0),
              child:
                  _activeIndex == 0 ? const IconText(iconName: 'Home') : null,
            ),
            Tab(
              icon: IconWidget(
                activeIndex: _activeIndex,
                index: 1,
                url: 'images/icons/icons8-search-64.png',
              ),
              iconMargin: const EdgeInsets.all(0.0),
              child:
                  _activeIndex == 1 ? const IconText(iconName: 'Search') : null,
            ),
            Tab(
              icon: Stack(
                children: [
                  IconWidget(
                    activeIndex: _activeIndex,
                    index: 2,
                    url: 'images/icons/icons8-shopping-cart-64.png',
                  ),
                  Provider.of<CartList>(context).showBadge
                      ? Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              Provider.of<CartList>(context)
                                  .cart
                                  .length
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : const Text(''),
                ],
              ),
              iconMargin: const EdgeInsets.all(0.0),
              child:
                  _activeIndex == 2 ? const IconText(iconName: 'Cart') : null,
            ),
            Tab(
              icon: IconWidget(
                activeIndex: _activeIndex,
                index: 3,
                url: 'images/icons/icons8-discount-50.png',
              ),
              iconMargin: const EdgeInsets.all(0.0),
              child:
                  _activeIndex == 3 ? const IconText(iconName: 'Offer') : null,
            ),
            Tab(
              icon: IconWidget(
                activeIndex: _activeIndex,
                index: 4,
                url: 'images/icons/icons8-customer-50.png',
              ),
              iconMargin: const EdgeInsets.all(0.0),
              child: _activeIndex == 4
                  ? const IconText(iconName: 'Account')
                  : null,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: _tabController,
        children: [
          Home(name: widget.name),
          const SearchScreen(),
          const CartScreen(),
          const OfferScreen(),
          const ProfileScreen()
        ],
      ),
    );
  }
}
