import 'package:flutter/material.dart';

class TaskProMessageModals {
  static void showLoadingModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Patientez svp...'),
            ],
          ),
        );
      },
    );
  }

  static void showMessageModal(BuildContext context, String message, bool isSuccess, [Function()? action]) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                isSuccess ? Icons.check_circle : Icons.error,
                color: isSuccess ? Colors.green : Colors.red,
                size: 64,
              ),
              SizedBox(width: 10),
              Text(message, textAlign: TextAlign.center,),
            ],
          ),
          actions: [
            if (isSuccess)
              TextButton(
                onPressed: () {
                  action!();
                },
                child: Text('Continuer'),
              )
            else 
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fermer'),
              ),
          ],
        );
      },
    );
  }

  static void showFailModal(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            
          ],
        );
      },
    );
  }
}