import 'package:flutter/material.dart';
import 'package:plantopia/constants/constants.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProfileWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Constants.blackColor.withOpacity(0.5),
                size: 24.0,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Constants.blackColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Constants.blackColor.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
