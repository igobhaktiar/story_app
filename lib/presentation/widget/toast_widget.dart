import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

void toastWidget({
  required String message,
  required Color? color,
  required Color? textColor,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: textColor,
    fontSize: 16.0,
  );
}