import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:epaypodcoderwithgetx/app/classes/SnackBar.dart';
import 'package:epaypodcoderwithgetx/app/classes/ePayApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AuthRegisterController extends GetxController {
  var name_surname = ''.obs;
  final phone_var = ''.obs;
  final pass_var = ''.obs;
  final pass_confirm_var = ''.obs;
  final credit_card_numb = ''.obs;
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
  void onClose() {}

  void setNameSrn(String nmsrnm) {
    name_surname(nmsrnm.toString());
  }

  void setPhone(PhoneNumber phone) {
    phone_var(phone.toString());
  }

  void setPass(String pass) {
    validatepass(pass) == true
        ? setted(pass, 'pass')
        : error_message('writepassright'.tr);
  }

  void setRePass(String pass) {
    validatepass(pass) == true
        ? setted(pass, 're_pass')
        : error_message('writepassright'.tr);
  }

  void setCardNumber(String creditcard) {
    validateCardNumb(creditcard) == true
        ? credit_card_numb(creditcard)
        : error_message('writecardright'.tr);
  }

  bool validateCardNumb(String creditcard) {
    CreditCardValidator _ccValidator = CreditCardValidator();
    var ccNumResults = _ccValidator.validateCCNum(creditcard);
    print(ccNumResults);
    if (ccNumResults.isPotentiallyValid) {
      return true;
    }
    return false;
  }

  void setted(String data, String type) {
    error_message('');
    if (type == 'phone') {
      phone_var(data);
    } else if (type == "pass") {
      pass_var(data);
    } else if (type == "re_pass") {
      pass_confirm_var(data);
    }
  }

  bool validatepass(String pass) {
    return pass.length >= 8 ? true : false;
  }

  void register() async {
    if (validateData() == true) {
      try {
        var response = await EPayApi.dio.post('auth/register', data: {
          "name": name_surname.toString(),
          "phone": phone_var.toString(),
          "password": pass_var.toString(),
          "password_confirmation": pass_confirm_var.toString(),
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
    return name_surname.value != null &&
            phone_var.value != null &&
            phone_var.value != '' &&
            validatepass(pass_var.value) &&
            validatepass(pass_confirm_var.value) &&
            pass_var.value == pass_confirm_var.value
        ? true
        : false;
  }
}
