import 'package:flutter/material.dart';
import 'package:get/get.dart';

void successSnackBarMessage(String message) {
  Get.snackbar(
    'Success!',
    message,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    titleText: const Text(
      'Success!',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
    ),
  );
}

void errorSnackBarMessage(String message) {
  Get.snackbar(
    'Error!',
    message,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    titleText: const Text(
      'Error!',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
    ),
  );
}
