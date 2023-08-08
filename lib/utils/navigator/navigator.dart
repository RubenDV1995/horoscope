import 'package:flutter/material.dart';

void goTo({
  required String routeName,
  required BuildContext context,
}) {
  Navigator.pushReplacementNamed(
    context,
    routeName,
  );
}

void goToPush({
  required Widget page,
  required BuildContext context,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
