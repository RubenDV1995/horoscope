import 'package:flutter/material.dart';

class CustomDefaultPage extends StatelessWidget {
  final Widget body;
  final double? padding;

  const CustomDefaultPage({
    required this.body,
    Key? key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(
          padding != null ? padding! : 0.0,
        ),
        child: body,
      ),
    );
  }
}
