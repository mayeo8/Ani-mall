import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/screens/about_screen.dart';
import 'package:ani_mall/screens/change_password.dart';
import 'package:ani_mall/screens/contact_screen.dart';
import 'package:ani_mall/screens/favorite_screen.dart';
import 'package:ani_mall/screens/login_screen.dart';
import 'package:ani_mall/screens/terms_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/provider_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notificationBool = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
            ? Colors.black
            : Colors.white,
        appBar: CustomAppBar(
          widget: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Text(
                'Profile',
                style: kFontFamily.copyWith(
                  fontSize: 22.0,
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? const Color(0xffD8D8D8)
                      : Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.flag,
                    color: Provider.of<ThemeProvider>(context).isDarkMode
                        ? const Color(0xffD8D8D8)
                        : Colors.black,
                  ),
                  Text(
                    'English',
                    style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).isDarkMode
                          ? const Color(0xffD8D8D8)
                          : Colors.black,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minRadius: 50.0,
                    child: Image.asset(
                      'images/Ellipse 148.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.260,
                          child: Text(
                            Provider.of<UserName>(context).name,
                            style: kFontFamily.copyWith(
                                color: Provider.of<ThemeProvider>(context)
                                        .isDarkMode
                                    ? const Color(0xffE2E2E2)
                                    : const Color(0xff1D1D1D),
                                fontSize: 32.0),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.260,
                          child: Text(
                            Provider.of<UserName>(context).email,
                            style: kSans.copyWith(
                              fontSize: 16.0,
                              color:
                                  Provider.of<ThemeProvider>(context).isDarkMode
                                      ? const Color(0xffE2E2E2)
                                      : const Color(0xff1D1D1D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              ProfileList(
                icon: Icons.nightlight_outlined,
                text: 'Dark mode',
                widget: SizedBox(
                  height: 25.0,
                  child: Switch(
                    activeColor: Colors.greenAccent,
                    value: Provider.of<ThemeProvider>(context).isDarkMode,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleDarkMode(value);
                    },
                  ),
                ),
                onTap: () {},
              ),
              ProfileList(
                icon: Icons.notifications,
                text: 'Notifications',
                widget: SizedBox(
                  height: 25.0,
                  child: Switch(
                    activeColor: Colors.greenAccent,
                    value: notificationBool,
                    onChanged: (value) {
                      setState(() {
                        notificationBool = value;
                      });
                    },
                  ),
                ),
                onTap: () {},
              ),
              ProfileList(
                icon: Icons.favorite,
                text: 'Favorite',
                widget: Icon(
                  Icons.arrow_circle_right,
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? const Color(0xffE2E2E2)
                      : const Color(0xff1D1D1D),
                ),
                onTap: () {
                  Navigator.pushNamed(context, FavoriteScreen.id);
                },
              ),
              ProfileList(
                icon: Icons.security,
                text: 'Change password',
                widget: Icon(
                  Icons.arrow_circle_right,
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? const Color(0xffE2E2E2)
                      : const Color(0xff1D1D1D),
                ),
                onTap: () {
                  Navigator.pushNamed(context, ChangePassword.id);
                },
              ),
              ProfileList(
                icon: Icons.info_outline_sharp,
                text: 'About',
                widget: Icon(
                  Icons.arrow_circle_right,
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? const Color(0xffE2E2E2)
                      : const Color(0xff1D1D1D),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AboutScreen.id);
                },
              ),
              ProfileList(
                icon: Icons.policy,
                text: 'Terms and policy',
                widget: Icon(
                  Icons.arrow_circle_right,
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? const Color(0xffE2E2E2)
                      : const Color(0xff1D1D1D),
                ),
                onTap: () {
                  Navigator.pushNamed(context, TermsConditionScreen.id);
                },
              ),
              ProfileList(
                icon: Icons.phone,
                text: 'Contact us',
                widget: const Text(''),
                onTap: () {
                  Navigator.pushNamed(context, ContactScreen.id);
                },
              ),
              ProfileList(
                icon: Icons.logout,
                text: 'Logout',
                widget: const Text(''),
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Are you sure you want to logout?',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: kGreenButtonColor),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, LoginScreen.id);
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: kGreenButtonColor),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileList extends StatelessWidget {
  const ProfileList({
    super.key,
    required this.icon,
    required this.text,
    required this.widget,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final Widget widget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: ListTile(
        splashColor: kBackgroundGreenColor,
        minLeadingWidth: 10,
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          icon,
          size: 24.0,
          color: Provider.of<ThemeProvider>(context).isDarkMode
              ? const Color(0xffE2E2E2)
              : const Color(0xff1D1D1D),
        ),
        title: Text(
          text,
          style: kFontFamily.copyWith(
            fontSize: 22.0,
            color: text == 'Logout'
                ? Colors.red
                : Provider.of<ThemeProvider>(context).isDarkMode
                    ? const Color(0xffE2E2E2)
                    : const Color(0xff1D1D1D),
          ),
        ),
        trailing: widget,
      ),
    );
  }
}
// class ProfileList extends StatelessWidget {
//   const ProfileList({
//     super.key,
//     required this.icon,
//     required this.text,
//     required this.widget,
//     required this.onTap,
//   });
//
//   final IconData icon;
//   final String text;
//   final Widget widget;
//   final VoidCallback onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: Icon(
//                     icon,
//                     size: 24.0,
//                     color: Provider.of<ThemeProvider>(context).isDarkMode
//                         ? const Color(0xffE2E2E2)
//                         : const Color(0xff1D1D1D),
//                   ),
//                 ),
//                 Text(
//                   text,
//                   style: kFontFamily.copyWith(
//                     fontSize: 22.0,
//                     color: text == 'Logout'
//                         ? Colors.red
//                         : Provider.of<ThemeProvider>(context).isDarkMode
//                         ? const Color(0xffE2E2E2)
//                         : const Color(0xff1D1D1D),
//                   ),
//                 ),
//               ],
//             ),
//             widget,
//           ],
//         ),
//       ),
//     );
//   }
// }
