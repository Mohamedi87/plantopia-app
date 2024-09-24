import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantopia/constants/constants.dart';
import 'package:plantopia/widgets/custom_textfield.dart';
import 'package:plantopia/ui/screens/auth/signin_page.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset('assets/images/reset-password.png'),
              const Text(
                'Forgot Password  ',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const CustomTextField(
                obscureText: false,
                icon: Icons.alternate_email,
                hintText: 'Enter Email',
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  child: const Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      child: const SignIn(),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Have an account? ",
                          style: TextStyle(color: Constants.blackColor),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(color: Constants.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
