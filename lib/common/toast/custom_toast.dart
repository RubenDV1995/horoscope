import 'package:flutter/material.dart';

import '../../constants/colors.dart';

enum TypeToast {
  waring,
  successful,
  info,
  error,
}

class CustomToast extends StatelessWidget {
  final String message;
  final TypeToast typeToast;

  const CustomToast({
    super.key,
    required this.message,
    required this.typeToast,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: typeToast == TypeToast.info
                ? MainColor.stateGreen
                : typeToast == TypeToast.waring
                    ? MainColor.stateRed
                    : typeToast == TypeToast.successful
                        ? MainColor.primaryColor200
                        : MainColor.accentColor1000,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: MainColor.bgColor100,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

void showToast({
  required BuildContext context,
  required String message,
  required TypeToast typeToast,
}) {
  final toast = CustomToast(
    message: message,
    typeToast: typeToast,
  );
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: MediaQuery.of(context).size.height * 0.03,
      width: MediaQuery.of(context).size.width,
      child: toast,
    ),
  );

  Overlay.of(context).insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
