import 'package:epaypodcoderwithgetx/app/classes/SnackBar.dart';
import 'package:epaypodcoderwithgetx/app/classes/ePayApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AuthForgetpassController extends GetxController {
  final phone_var = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setPhone(PhoneNumber phone) {
    phone_var(phone.toString());
  }

  void forgetPass() async {
    if (validateData() == true) {
      try {
        var response = await EPayApi.dio.post('auth/forgetpass', data: {
          "phone": phone_var.toString(),
        });
        print(response);
      } catch (e) {
        print(e.toString());
        showSnackbar('error'.tr, e.toString(), Colors.red);
      }
    } else {
      showSnackbar('error'.tr, 'datanotValidated'.tr, Colors.red);
    }
  }

  bool validateData() {
    return phone_var.value != null && phone_var.value != '' ? true : false;
  }
}
