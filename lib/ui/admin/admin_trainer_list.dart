import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ignou_project/ui/admin/trainer_details_screen.dart';
import '../../model/dog.dart';
import '../../model/trainer.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/utils.dart';

class AdminTrainerListScreen extends StatefulWidget {
  @override
  State<AdminTrainerListScreen> createState() => _AdminTrainerListScreenState();
}

class _AdminTrainerListScreenState extends State<AdminTrainerListScreen> {
  var trainerList=<Trainer>[].obs;


  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    trainerList.value= await getTrainerList();
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
              title: Text('Trainers List',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),),
            ),
            body:  Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListView.builder(
                itemCount: trainerList.value.length,
                itemBuilder: (context, index) {
                  return TrainerListItem(
                    trainer: trainerList.value[index],
                  );
                },
              ),
            ),
          );
        }
    );
  }


/*
  Widget TrainerList(){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListView.builder(
        itemCount: trainerList.value.length,
        itemBuilder: (context, index) {
          return TrainerListItem(
            trainer: trainerList.value[index],
          );
        },
      ),
    );
  }
*/

}


class TrainerListItem extends StatelessWidget {
  final Trainer trainer;

  TrainerListItem({required this.trainer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> TrainerDetailsScreen(trainer: trainer,));
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [CC.primaryColor, CC.secondaryColor, CC.thirdColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  AppIcons.profile, // Replace with your image URL
                  width: 120.sp, // Adjust the image size as needed
                  height: 120.sp,fit: BoxFit.cover,
                ),
              ),),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trainer.trainerName ?? "",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                  U.addGap(10),
                  Text(
                    "Trainer experience: ${trainer.trainerExperience}", // Replace with the actual price
                    maxLines: 5 ,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  U.addGap(10),
                  Text(
                    "Trainer Specialization: ${trainer.trainerSpecialization}", // Replace with the actual price
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }



}