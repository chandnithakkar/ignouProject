import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../model/dog.dart';
import '../../model/trainer.dart';
import '../../route/app_pages.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/common_form_button.dart';
import '../../utils/font_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../utils/utils.dart';


class AdminDashboard extends StatefulWidget {
  AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => AdminDashboardScreen();
}

class AdminDashboardScreen extends State<AdminDashboard> {
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
          menuScreen: MenuScreen(),
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

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final MyDrawerController _myDrawerController = Get.put(MyDrawerController());
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
                      title: Text("Add Dog"),
                      onTap: () {
                        Get.toNamed(Routes.addDogScreen);
                        // Handle Add Dog action
                      },
                    ),
                    ListTile(
                      title: Text("Add Trainer"),
                      onTap: () {
                        Get.toNamed(Routes.addTrainerScreen);
                        // Handle Add Trainer action
                      },
                    ),
                    ListTile(
                      title: Text("Orders"),
                      onTap: () {
                        _myDrawerController.toggleDrawer();
                        Get.toNamed(Routes.addTrainerScreen);
                        // Handle Add Trainer action
                      },
                    ),
                    /*              ListTile(
                      title: Text("Add Service"),
                      onTap: () {
                        // Handle Add Service action
                      },
                    ),*/
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () {

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
  var isLoading=false.obs;

  final MyDrawerController _myDrawerController = Get.put(MyDrawerController());
  var _current = 0.obs;
  final CarouselController _controller = CarouselController();
  var dogsList=<Dog>[].obs;
  var trainersList=<Trainer>[].obs;
  var dropDownDogsService = <String>["Army", "Sniffer", "Guide","Other"].obs;

    @override
    void initState() {
        getData();
      super.initState();
    }

     getData() async {
       dogsList.value= await getDogList();
       trainersList.value= await getTrainerList();
    }

  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      U.addGap(20),
                      CouroselWidget(),
                      Dots(),
                      DogsList(),
                      U.addGap(20),
                      Divider(
                        color: Colors.black38,
                        height: 2,
                      ),
                      U.addGap(20),
                      TrainersList(),
                      U.addGap(20),
                      Divider(
                        color: Colors.black38,
                        height: 2,
                      ),
                      U.addGap(20),
                      ServiceList(),
                      U.addGap(20),
                      Divider(
                        color: Colors.black38,
                        height: 2,
                      ),
                      U.addGap(20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Future<List<Dog>> getDogList() async {
    final databaseReference = FirebaseDatabase.instance.ref('dog');
    final snapshot = await databaseReference.get();
    final dogs = <Dog>[];

    if (snapshot != null && snapshot.value != null) {
      final data = snapshot.value as Map<dynamic, dynamic>;

      // Transform the data into the expected format
      final transformedData = transformDogsFirebaseData(data);

      // Deserialize and add each dog entry to the list
      for (final entry in transformedData.entries) {
        try {
          final dog = Dog.fromJson(entry.value);
          dogs.add(dog);
        } catch (e) {
          print('Error parsing dog data: $e');
        }
      }
    } else {
      print('No data available from Firebase');
    }
    return dogs;
  }

  Future<List<Trainer>> getTrainerList() async {
    final databaseReference = FirebaseDatabase.instance.ref('trainer');
    final snapshot = await databaseReference.get();
    final trainers = <Trainer>[];

    if (snapshot != null && snapshot.value != null) {
      final data = snapshot.value as Map<dynamic, dynamic>;

      // Transform the data into the expected format
      final transformedData = transformTrainersFirebaseData(data);

      // Deserialize and add each dog entry to the list
      for (final entry in transformedData.entries) {
        try {
          final trainer = Trainer.fromJson(entry.value);
          trainers.add(trainer);
        } catch (e) {
          print('Error parsing trainer data: $e');
        }
      }
    } else {
      print('No data available from Firebase');
    }
    return trainers;
  }

  Map<dynamic, dynamic> transformDogsFirebaseData(Map<dynamic, dynamic> data) {

    final transformedData = <dynamic, dynamic>{};

    data.forEach((key, value) {
      if (value is Map<dynamic, dynamic>) {
        final dogData = {
          'dogAchievements': value['dogAchievements'],
          'dogAge': value['dogAge'],
          'dogPriceWTrainer': value['dogPriceWTrainer'],
          'dogPriceWoutTrainer': value['dogPriceWoutTrainer'],
          'dogBreed': value['dogBreed'],
          'dogName': value['dogName'],
          'trainerId': value['trainerId'],

        };
        transformedData[key] = dogData;
      }
    });

    return transformedData;
  }

  Map<dynamic, dynamic> transformTrainersFirebaseData(Map<dynamic, dynamic> data) {

    final transformedData = <dynamic, dynamic>{};

    data.forEach((key, value) {
      if (value is Map<dynamic, dynamic>) {
        final trainerData = {
          'trainerAchievements': value['trainerAchievements'],
          'trainerDetails': value['trainerDetails'],
          'trainerExperience': value['trainerExperience'],
          'trainerName': value['trainerName'],
          'trainerSpecialization': value['trainerSpecialization'],
          'trainerId': value['trainerId'],
        };
        transformedData[key] = trainerData;
      }
    });
    return transformedData;
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

  Widget DogsList(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Dogs',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 100, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dogsList.value.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150, // Adjust the width as needed
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [CC.primaryColor, CC.secondaryColor, CC.thirdColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dogsList.value[index].dogName??"",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Customize text color
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget TrainersList(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Trainers',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 100, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trainersList.value.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150, // Adjust the width as needed
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [CC.primaryColor, CC.secondaryColor, CC.thirdColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      trainersList.value[index].trainerName,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Customize text color
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget ServiceList(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Services',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 100, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:  dropDownDogsService.value.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150, // Adjust the width as needed
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [CC.primaryColor, CC.secondaryColor, CC.thirdColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dropDownDogsService.value[index],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Customize text color
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
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
