import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.childCard,
    Key? key,
  }) : super(key: key);
  final Widget childCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: Center(child: childCard),
    );
  }
}
