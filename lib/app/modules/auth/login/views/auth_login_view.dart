import 'package:epaypodcoderwithgetx/app/routes/app_pages.dart';
import 'package:epaypodcoderwithgetx/app/theme/Colors.dart';
import 'package:epaypodcoderwithgetx/app/theme/Images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../controllers/auth_login_controller.dart';

class AuthLoginView extends GetView<AuthLoginController> {
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
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2,
                child: Center(
                  child: Image.asset(Images.logo),
                ),
              ),
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
                textFieldController: controller.phoneController,
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
              TextFormField(
                  onChanged: (String pass) {
                    controller.setPass(pass);
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      errorText: controller.error_message.value != ''
                          ? controller.error_message.value
                          : null,
                      hintText: "writepass".tr,
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          borderSide:
                              BorderSide(color: primaryColor, width: 2)),
                      contentPadding: new EdgeInsets.all(5))),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        controller.signIn();
                      },
                      color: Theme.of(context).primaryColor,
                      animationDuration: Duration(milliseconds: 1000),
                      height: 50,
                      child: Center(
                        child: Text("login".tr,
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
                      onPressed: () => Get.toNamed(Routes.AUTH_FORGETPASS),
                      child: Text("forgetpass".tr)),
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
