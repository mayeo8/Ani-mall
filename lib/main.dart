import 'package:ani_mall/data/provider_data.dart';
import 'package:ani_mall/screens/about_screen.dart';
import 'package:ani_mall/screens/change_password.dart';
import 'package:ani_mall/screens/contact_screen.dart';
import 'package:ani_mall/screens/favorite_screen.dart';
import 'package:ani_mall/screens/terms_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/boarding_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/delivery_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tabs/search_tab.dart';
import 'screens/wait_list_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartList()),
        ChangeNotifierProvider(create: (context) => LocationList()),
        ChangeNotifierProvider(create: (context) => UserName()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ProductList()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ani-Mall',
      theme: ThemeData.light(),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        OnBoardingScreen.id: (context) => const OnBoardingScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        CreateAccountScreen.id: (context) => const CreateAccountScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        WaitListScreen.id: (context) => const WaitListScreen(),
        SearchScreen.id: (context) => const SearchScreen(),
        DeliveryScreen.id: (context) => const DeliveryScreen(),
        ChangePassword.id: (context) => const ChangePassword(),
        AboutScreen.id: (context) => const AboutScreen(),
        TermsConditionScreen.id: (context) => const TermsConditionScreen(),
        ContactScreen.id: (context) => const ContactScreen(),
        FavoriteScreen.id: (context) => const FavoriteScreen(),
      },
    );
  }
}
