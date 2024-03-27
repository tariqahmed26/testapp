import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showInSnackBar(String value,
    {Color? color, int? duration,  IconData? icon}) {
  FocusManager.instance.primaryFocus?.unfocus();
  final SnackBar snackBar = SnackBar(
    margin: EdgeInsets.only(bottom: Get.height * 0.75, left: 30, right: 30),
    content: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(width:Get.width*0.01 ,),
        Expanded(
         
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'caviarbold'),
          ),
        ),
      ],
    ),
    dismissDirection: DismissDirection.up,
    backgroundColor: color ?? Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: Duration(milliseconds: duration ?? 1000),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );

  snackbarKey.currentState?.showSnackBar(snackBar);
}

