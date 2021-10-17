import 'package:epaypodcoderwithgetx/app/classes/SnackBar.dart';
import 'package:epaypodcoderwithgetx/app/classes/ePayApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AuthLoginController extends GetxController {
  final phone_var = ''.obs;
  final pass_var = ''.obs;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  var error_message = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
    passController.dispose();
  }

  void setPhone(PhoneNumber phone) {
    phone_var(phone.toString());
  }

  void setPass(String pass) {
    validatepass(pass) == true
        ? setted(pass, 'pass')
        : error_message('writepassright'.tr);
  }

  void setted(String data, String type) {
    error_message('');
    if (type == 'phone') {
      phone_var(data);
    } else if (type == "pass") {
      pass_var(data);
    }
  }

  bool validatepass(String pass) {
    return pass.length >= 8 ? true : false;
  }

  void signIn() async {
    if (validateData() == true) {
      try {
        var response = await EPayApi.dio.post('auth/login',
            data: {"phone": phone_var.toString(), "pass": pass_var.toString()});
      } catch (e) {
        print(e.toString());
        // showSnackbar('error'.tr, e.toString(), Colors.red);
      }
    } else {
      showSnackbar('error'.tr, 'datanotValidated'.tr, Colors.red);
    }
  }

  bool validateData() {
    return phone_var.value != null &&
            phone_var.value != '' &&
            validatepass(pass_var.value)
        ? true
        : false;
  }
}
