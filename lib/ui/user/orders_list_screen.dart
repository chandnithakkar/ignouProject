import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../model/dog.dart';
import '../../model/orders.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/utils.dart';
import 'dogs_details.dart';

class OrderListScreen extends StatefulWidget {
  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  var dogsList=<Order>[].obs;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    dogsList.value= await getOrdersList();
  }

  Future<List<Order>> getOrdersList() async {
    final databaseReference = FirebaseDatabase.instance.ref('orders');
    final snapshot = await databaseReference.get();
    final dogs = <Order>[];

    if (snapshot != null && snapshot.value != null) {
      final data = snapshot.value as Map<dynamic, dynamic>;

      // Transform the data into the expected format
      final transformedData = transformDogsFirebaseData(data);

      // Deserialize and add each order entry to the list
      for (final entry in transformedData.entries) {
        try {
          final order = Order.fromJson(entry.value);
          dogs.add(order);
          print('added successfully');

        } catch (e) {
          print('Error parsing order data: $e');
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
          'orderID': value['orderID'],
          'userID': value['userID'],
          'dogID': value['dogID'],
          'startDate': value['startDate'],
          'endDate': value['endDate'],
          'payMode': value['payMode'],
          'withWithoutTrainer': value['withWithoutTrainer'],
          'address': value['address'],
          'price': value['price'],
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
              title: Text('Order List',
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
      padding:EdgeInsets.all(4.0),
      child: ListView.builder(
        itemCount: dogsList.value.length,
        itemBuilder: (context, index) {
          return DogListItem(
            order: dogsList.value[index],
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

class DogListItem extends StatelessWidget {
  final Order order;

  DogListItem({required this.order});

  @override
  Widget build(BuildContext context) {
    var width = U.getScreenWidth(context);
    var height = U.getScreenHeight(context);

    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      width: width-100,

      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [CC.primaryColor, CC.secondaryColor, CC.thirdColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Order ID: ${order.orderID}",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                U.addGap(10),
                Text(
                  "Dog ID: ${order.dogID}", // Replace with the actual price
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                U.addGap(10),

                Text(
                  "Start Date: ${order.startDate}", // Replace with the actual price
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                U.addGap(10),
                Text(
                  "End Date: ${order.endDate}", // Replace with the actual price
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                U.addGap(10),

                Text(
                  "Payment mode: ${order.payMode}", // Replace with the actual price
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                U.addGap(10),

                Text(
                  "Address : ${order.address}", // Replace with the actual price
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                U.addGap(10),

                Text(
                  "Price : ${order.price}", // Replace with the actual price
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
    );
  }
}