import 'package:epaypodcoderwithgetx/app/routes/app_pages.dart';
import 'package:epaypodcoderwithgetx/app/theme/Colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../controllers/auth_forgetpass_controller.dart';

class AuthForgetpassView extends GetView<AuthForgetpassController> {
  String initialCountry = 'AZ';
  PhoneNumber number = PhoneNumber(isoCode: 'AZ');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              "forgetpass".tr,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).primaryColor,
                  size: 25,
                ))),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  controller.setPhone(number);
                },
                onInputValidated: (bool value) {
                  controller.setPhone(number);
                },
                selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    leadingPadding: 0,
                    showFlags: true,
                    useEmoji: true),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black54),
                initialValue: number,
                formatInput: true,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: primaryColor, width: 2)),
                onSaved: (PhoneNumber number) {
                  controller.setPhone(number);
                },
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        controller.forgetPass();
                      },
                      color: Theme.of(context).primaryColor,
                      animationDuration: Duration(milliseconds: 1000),
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                      child: Center(
                        child: Text("forgetpass".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Get.toNamed(Routes.AUTH_LOGIN),
                      child: Text("login".tr)),
                  TextButton(
                      onPressed: () => Get.toNamed(Routes.AUTH_REGISTER),
                      child: Text("register".tr)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
