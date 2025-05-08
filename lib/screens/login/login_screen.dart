import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/services/auth_service.dart';
import 'package:flutter_task_catalift/widgets/custom_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final _authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _loginWithEmail(String email, String password) async {
    try {
      _authService.signInWithEmailPassword(email, password);
      Get.snackbar("Success", "Logged in successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final user = await _authService.signInWithGoogle();

      if (user != null) {
        Get.snackbar("Success", "Google sign-in successful");
        Get.offAll(() => const HomeScreen()); // Navigate to home page
      } else {
        Get.snackbar("Cancelled", "Google sign-in was cancelled");
      }
    } catch (e) {
      Get.snackbar("Google Sign-In Failed", e.toString());
      print(e); // Log the error for further debugging
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView( // Add this to prevent overflow when keyboard is open
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Login heading and welcome message
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login Here",
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Welcome back! You've been missed.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),

              // Email and Password fields
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(label: "Email", controller: emailController),
                    SizedBox(height: 20),
                    CustomTextField(
                      label: "Password",
                      controller: passwordController,
                      obscureText: true,
                    ),
                    SizedBox(height: 3),

                    // Forgot Password text beside the password field
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Navigate to forget password screen
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Login button
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    _loginWithEmail(email, password);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Small dash divider
              SizedBox(height: 25),
              TextButton(
                onPressed: () {
                  // Navigate to sign-up screen
                },
                child: Text(
                  "Create new account",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 80),
              Text(
                "Or continue with",
                style: GoogleFonts.poppins(

                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 20),
              // Sign in with Google button
              IconButton(
                onPressed: _signInWithGoogle,
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                  size: 30,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey,
                  padding: EdgeInsets.all(16), // Good spacing
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              // Create New Account text below Google sign-in button


            ],
          ),
        ),
      ),
    );
  }
}
