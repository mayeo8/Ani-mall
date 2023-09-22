import 'package:ani_mall/components/alert_box.dart';
import 'package:ani_mall/components/button_component.dart';
import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/location_list.dart';
import 'package:ani_mall/data/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);
  static String id = 'delivery_screen';

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  String locationValue = '';
  int selectedIndex = -1;
  late TextEditingController controller;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void checkBoxLogic(int index) {
    setState(() {
      if (selectedIndex == index) {
        // Clicked checkbox is already selected, unselect it
        Provider.of<LocationList>(context, listen: false)
            .location[index]
            .isChecked = false;
        selectedIndex = -1;
      } else {
        // Unselect the previously selected checkbox
        if (selectedIndex != -1) {
          Provider.of<LocationList>(context, listen: false)
              .location[selectedIndex]
              .isChecked = false;
        }
        // Select the clicked checkbox
        Provider.of<LocationList>(context, listen: false)
            .location[index]
            .isChecked = true;
        selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provideLocation = Provider.of<LocationList>(context).location;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          widget: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {});
                        Navigator.pop(context, 'refresh');
                      },
                      icon: const Icon(Icons.arrow_circle_left_rounded),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Delivery',
                    style: kFontFamily.copyWith(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(
                  child: Text(''),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              SizedBox(
                height: 400.0,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset('images/map.png'),
                ),
              ),
              SizedBox(
                width: 350.0,
                height: 40.0,
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  onChanged: (value) {
                    setState(() {
                      locationValue = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Location here',
                    hintStyle: const TextStyle(
                        fontFamily: 'Inria Sans',
                        fontSize: 16.0,
                        color: Color(0xff9C9C9C)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xff9C9C9C),
                    ),
                    contentPadding:
                        const EdgeInsets.fromLTRB(32.0, 16.0, 32, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                      borderSide: const BorderSide(
                        color: Color(0xff9C9C9C),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff9C9C9C),
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  cursorColor: const Color(0xff9C9C9C),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Recent locations',
                      style: kFontFamily.copyWith(
                        fontSize: 18.0,
                        color: const Color(0xff7C7C7C),
                      ),
                    ),
                    provideLocation.isEmpty
                        ? SizedBox(
                            height: 140.0,
                            child: Center(
                              child: Text(
                                  'Your Location Will Show Up Here Once Added',
                                  style: kSans.copyWith(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff9C9C9C),
                                  )),
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: provideLocation.length,
                            itemBuilder: (BuildContext context, int index) {
                              bool isChecked = provideLocation[index].isChecked;
                              return Column(
                                children: [
                                  ListTile(
                                    horizontalTitleGap: 2.0,
                                    // minLeadingWidth: 40 - 10,
                                    contentPadding: EdgeInsets.zero,
                                    onTap: () {
                                      checkBoxLogic(index);
                                    },
                                    leading: Icon(
                                      Icons.location_on_outlined,
                                      size: 30.0,
                                      color: isChecked
                                          ? const Color(0xff36D5AD)
                                              .withOpacity(0.4)
                                          : const Color(0xff292D32)
                                              .withOpacity(0.4),
                                    ),
                                    title: Text(
                                      provideLocation[index].name,
                                      style: kSans.copyWith(
                                          fontSize: 16.0,
                                          color: isChecked
                                              ? const Color(0xff36D5AD)
                                              : const Color(0xff272727)),
                                    ),
                                    trailing: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: SizedBox(
                                        height: 16.0,
                                        width: 16.0,
                                        child: ColoredBox(
                                          color: isChecked
                                              ? Colors.transparent
                                              : const Color(0xff292D32)
                                                  .withOpacity(0.4),
                                          child: Checkbox(
                                            side: BorderSide(
                                                color: const Color(0xff292D32)
                                                    .withOpacity(0.4)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            fillColor: MaterialStatePropertyAll(
                                              const Color(0xff36D5AD)
                                                  .withOpacity(0.4),
                                            ),
                                            checkColor: const Color(0xff36D5AD),
                                            value: isChecked,
                                            onChanged: (value) {
                                              checkBoxLogic(index);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Color(0xff7C7C7C),
                                    thickness: 1.0,
                                  ),
                                ],
                              );
                            }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 44.0, vertical: 20.0),
                child: ButtonsWidget(
                  onPress: () {
                    setState(() {
                      if (locationValue.isEmpty) {
                        showDialog<String>(
                          context: context,
                          builder: (context) {
                            return AlertBox(
                              heading: 'Invalid Entry',
                              message:
                                  'Please Input A Valid Location And Try Again',
                              onPress: () {
                                Navigator.pop(context);
                              },
                              buttonText: 'Back',
                            );
                          },
                        );
                      } else {
                        controller.clear();
                        if (provideLocation.isNotEmpty) {
                          if (provideLocation.length == 2) {
                            provideLocation.removeLast();
                          }
                        }
                        provideLocation.insert(
                            0, Location(name: locationValue));
                        showDialog<String>(
                          context: context,
                          builder: (context) {
                            return AlertBox(
                              heading: 'Your location has been added',
                              message: 'Now let’s go shopping !',
                              onPress: () {
                                Navigator.pop(context);
                              },
                              buttonText: 'Back',
                            );
                          },
                        );
                        locationValue = '';
                        focusNode.unfocus();
                      }
                    });
                  },
                  color: kGreenButtonColor,
                  text: 'Save Location',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
