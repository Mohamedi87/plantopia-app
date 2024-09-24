import 'package:flutter/material.dart';
import 'package:plantopia/constants/constants.dart';

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    super.key,
    required this.plantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Constants.blackColor),
        ),
        Text(
          plantFeature,
          style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
