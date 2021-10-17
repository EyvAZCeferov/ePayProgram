import 'package:epaypodcoderwithgetx/app/routes/app_pages.dart';
import 'package:epaypodcoderwithgetx/app/theme/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../controllers/auth_register_controller.dart';

class AuthRegisterView extends GetView<AuthRegisterController> {
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
              "register".tr,
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
                height: 15,
              ),
              TextFormField(
                  onChanged: (String nmsrnm) {
                    controller.setNameSrn(nmsrnm);
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: "write_name_surname".tr,
                      prefixIcon: Icon(Icons.people),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          borderSide:
                              BorderSide(color: primaryColor, width: 2)),
                      contentPadding: new EdgeInsets.all(5))),
              SizedBox(
                height: 25,
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
              TextFormField(
                  onChanged: (String cardNumb) {
                    controller.setCardNumber(cardNumb);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      errorText: controller.error_message.value != ''
                          ? controller.error_message.value
                          : null,
                      hintText: "writecardnumber".tr,
                      prefixIcon: Icon(
                        Icons.credit_card,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          borderSide:
                              BorderSide(color: primaryColor, width: 2)),
                      contentPadding: new EdgeInsets.all(5))),
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
              TextFormField(
                  onChanged: (String pass) {
                    controller.setRePass(pass);
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      errorText: controller.error_message.value != ''
                          ? controller.error_message.value
                          : null,
                      hintText: "write_re_pass".tr,
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
                        controller.register();
                      },
                      color: Theme.of(context).primaryColor,
                      animationDuration: Duration(milliseconds: 1000),
                      height: 50,
                      child: Center(
                        child: Text("register".tr,
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
                      onPressed: () => Get.toNamed(Routes.AUTH_LOGIN),
                      child: Text("login".tr)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
