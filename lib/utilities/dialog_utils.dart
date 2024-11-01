import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(message),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      String title = '',
      required String message,
      String? posActionName,
      Function? posActionClick,
      String? negActionName,
      Function? negActionClick}) {
    List<Widget> action = [];
    if (posActionName != null) {
      action.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(posActionClick != null){
            //   posActionClick.call();
            // }
            posActionClick?.call();
          },
          child: Text(posActionName)));
    }
    if (negActionName != null) {
      action.add(TextButton(
          onPressed: () {
            Navigator.pop(context);

            negActionClick?.call();
          },
          child: Text(negActionName)));
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
              title: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              content: Text(message),
              actions: action);
        });
  }
}
