import 'package:flutter/cupertino.dart';

import '../utils/storage_service.dart';
import 'base_controller.dart';

class LoginController extends BaseController {
  var formKey3 = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
  final StorageService storageService = StorageService();
}
class AdminLoginController extends BaseController {
  var formKey4 = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
//final StorageService storageService = StorageService();
}