import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login/login_screen.dart';
import '../register/register_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.5,
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/onboarding.svg',
                  fit: BoxFit.cover,
                ),
              ),
        
              SizedBox(height: 54),
        
              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CATA ",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,

                    ),
                  ),
                  Text(
                    "L I F T",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigoAccent,
                        decoration: TextDecoration.overline
                    ),
                  ),
                ],
              ),
        
              SizedBox(height: 12),
        
              // Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Give your career an EXTRA boost!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
        
              SizedBox(height: 90),
        
              // Buttons Row
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Login Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.to(LoginScreen()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          elevation: 8
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    // Register Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.to(RegisterScreen()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          elevation: 8// Increase button height
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
