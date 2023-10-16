import 'package:flutter/cupertino.dart';
import 'base_controller.dart';
import 'package:get/get.dart';

class AddDogController extends BaseController {

  var formKey3 = GlobalKey<FormState>();
  TextEditingController dogBreedController = TextEditingController();
  TextEditingController dogNameController = TextEditingController();
  TextEditingController dogAgeController = TextEditingController();
  TextEditingController dogAchievementsController = TextEditingController();

  TextEditingController dogPriceWithController = TextEditingController();
  TextEditingController dogPriceWithOutController = TextEditingController();
  var selectedDogBreed = "".obs;
  var dropDownDogsList = <String>["German", "Labrador", "Bulldog","Doberman"].obs;

  var selectedDogService = "".obs;
  var dropDownDogsSErvice = <String>["Army", "Sniffer", "Guide","Other"].obs;
//final StorageService storageService = StorageService();
}
