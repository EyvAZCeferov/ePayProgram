import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String title, String message, Color bgCol) {
  Get.snackbar(
    title,
    message,
    backgroundColor: bgCol,
    colorText: Colors.white,
    snackStyle: SnackStyle.FLOATING,
    barBlur: 3,
    animationDuration: Duration(milliseconds: 1000),
    borderRadius: 8,
    dismissDirection: SnackDismissDirection.HORIZONTAL,
    duration: Duration(milliseconds: 1200),
    isDismissible: true,
    maxWidth: Get.width,
    padding: EdgeInsets.all(8),
    snackPosition: SnackPosition.BOTTOM,
  );
}
