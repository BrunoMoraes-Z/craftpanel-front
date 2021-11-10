import 'package:craft_panel/components/elevated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required BuildContext context,
  required String message,
  bool error = false,
}) {
  if (!kIsWeb) return;
  var ftoast = FToast();
  ftoast.init(context);
  Widget toast = Container(
    height: 40,
    width: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: error ? Colors.redAccent : Colors.greenAccent,
    ),
    child: Center(
      child: Text(message),
    ),
  );

  ftoast.showToast(
    child: Elevated(
      child: toast,
      borderRadius: BorderRadius.circular(6),
    ),
    toastDuration: Duration(seconds: 3),
  );
}
