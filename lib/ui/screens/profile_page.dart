import 'package:flutter/material.dart';
import 'package:plantopia/constants/constants.dart';
import 'package:plantopia/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(0.5),
                    width: 0.5,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      ExactAssetImage('assets/images/profile.jpeg'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mohamed Haj Mousa',
                      style: TextStyle(
                          color: Constants.blackColor, fontSize: 20.0),
                    ),
                    SizedBox(
                        height: 24.0,
                        child: Image.asset(
                          'assets/images/verified.png',
                          // height: 10,
                        )),
                  ],
                ),
              ),
              Text(
                'mh661700mh@gmail.com',
                style: TextStyle(color: Constants.blackColor.withOpacity(0.3)),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height * 0.7,
                width: size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileWidget(icon: Icons.person, title: 'My Profile'),
                    ProfileWidget(icon: Icons.settings, title: 'Settings'),
                    ProfileWidget(
                        icon: Icons.notifications, title: 'Notifications'),
                    ProfileWidget(icon: Icons.chat, title: 'FAQs'),
                    ProfileWidget(icon: Icons.share, title: 'Share'),
                    ProfileWidget(icon: Icons.logout, title: 'LogOut'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
