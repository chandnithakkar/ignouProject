import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../model/dog.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';

class AdminDogListScreen extends StatefulWidget {
  @override
  State<AdminDogListScreen> createState() => _AdminDogListScreenState();
}

class _AdminDogListScreenState extends State<AdminDogListScreen> {
  var dropDownDogsService = <String>["Army", "Sniffer", "Guide","Other"].obs;
  var dogsList=<Dog>[].obs;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    dogsList.value= await getDogList();
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
          print('added successfully');

        } catch (e) {
          print('Error parsing dog data: $e');
        }
      }
    } else {
      print('No data available from Firebase');
    }
    return dogs;
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

  @override
  Widget build(BuildContext context) {
    return Obx(
            () {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: GestureDetector(
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.back();
                },
              ),
              title: Text('Dogs List',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),),
            ),
            body: DogsList(),
          );
        }
    );
  }


  Widget DogsList(){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListView.builder(
        itemCount: dogsList.value.length,
        itemBuilder: (context, index) {
          return AdminDogListItem(
            dog: dogsList.value[index],
          );
        },
      ),
    );
  }

}

/*class DogsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dogsList.value.length,
      itemBuilder: (context, index) {
        return DogListItem(
          dog: dogsList.value[index],
        );
      },
    );
  }
}*/

class AdminDogListItem extends StatelessWidget {
  final Dog dog;

  AdminDogListItem({required this.dog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       // Get.to(() => DogDetailsScreen(dog: dog));
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.black26, Colors.black12, Colors.black45],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  AppIcons.lab, // Replace with your image URL
                  width: 120, // Adjust the image size as needed
                  height: 120,fit: BoxFit.cover,
                ),
              ),),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                U.addGap(5),
                Text(
                  dog.dogName ?? "",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                U.addGap(20),
                Text(
                  "Price without Trainer: \$${dog.dogPriceWoutTrainer}", // Replace with the actual price
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Price with Trainer: \$${dog.dogPriceWTrainer}", // Replace with the actual price
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top:8.0),
              child: Icon(Icons.edit,color:CC.black,),
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Delete'),
                        content: const Text('Are you sure you want to delete this dog?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: EdgeInsets.only(top:8.0),
                child: Icon(Icons.delete,color:CC.black,),
              ),
            )
          ],
        ),
      ),
    );
  }
}