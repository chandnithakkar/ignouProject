import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../route/app_pages.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/font_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../utils/utils.dart';

class UserDashboard extends StatefulWidget {
  UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => UserDashboardScreen();
}

class UserDashboardScreen extends State<UserDashboard> {
  final MyDrawerController _myDrawerController = Get.put(MyDrawerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ZoomDrawer(
          controller: _myDrawerController.zoomDrawerController,
          menuScreen: UserMenuScreen(),
          mainScreen: MainScreen(),
          borderRadius: 24.0,
          showShadow: true,
          angle: -12.0,
          drawerShadowsBackgroundColor: Colors.grey,
          slideWidth: MediaQuery.of(context).size.width * 0.65,
        ),
      ),
    );
  }
}

class UserMenuScreen extends StatefulWidget {
  const UserMenuScreen({Key? key}) : super(key: key);

  @override
  _UserMenuScreenState createState() => _UserMenuScreenState();
}

class _UserMenuScreenState extends State<UserMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 5.sp,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white54, Colors.white60, Colors.white70],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AppIcons.drawer_head,
                width: MediaQuery.of(context).size.width,
              ),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Book Services"),
                      onTap: () {
                        Get.toNamed(Routes.addDogScreen);
                        // Handle Add Dog action
                      },
                    ),
                    ListTile(
                      title: Text("Orders"),
                      onTap: () {
                        Get.toNamed(Routes.addTrainerScreen);
                        // Handle Add Trainer action
                      },
                    ),
                    ListTile(
                      title: Text("Explore"),
                      onTap: () {
                        // Handle Add Service action
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Logout action
                  },
                  child: Text("Logout"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MyDrawerController _myDrawerController = Get.put(MyDrawerController());
  var _current = 0.obs;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Dashboard",
          style: St.textFontRegular(
              size: 14.sp, weight: FontWeight.w500, color: CC.black),
        ),
        leading: GestureDetector(
            onTap: _myDrawerController.toggleDrawer,
            child: Icon(
              Icons.density_medium_sharp,
              size: 20.sp,
              color: Colors.blue,
            )),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            U.addGap(20),
            CouroselWidget(),
            Dots(),
          ],
        ),
      ),
    );
  }

  Widget CouroselWidget() {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          animateToClosest: true,
          viewportFraction: 0.7,
          enlargeCenterPage: true,
          aspectRatio: 2.3,
          onPageChanged: (index, reason) {
            /*  setState(() {*/
            _current.value = index;
            /*   });*/
          }),
      items: _myDrawerController.listOfImages
          .map((item) => Container(
        height: 200.sp,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(item ?? ""),
        ),
      ))
          .toList(),
    );
  }

  Widget Dots() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _myDrawerController.listOfImages.asMap().entries.map((entry) {
          return _current.value == entry.key
              ? GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(color: CC.white),
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Container(
                      width: 6.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(color: CC.purpleDark, width: 1),
                          color: CC.purpleDark)),
                )),
          )
              : GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin:
              EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.grey)
                      .withOpacity(0.4)),
            ),
          );
        }).toList(),
      );
    });
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  var listOfImages = <String>[
    AppIcons.dog_training1,
    AppIcons.dog_training2,
    AppIcons.dog_training3
  ];

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
}
