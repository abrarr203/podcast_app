import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/constraints.dart';
import 'package:podcast_app/screens/home_screen.dart';
import 'package:podcast_app/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const ScreenRoute = "/signup";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isObscured = true;
  GlobalKey<FormState> _foromstate = GlobalKey();
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  void openSigninScreen() {
    Navigator.of(context).pushReplacementNamed(LoginScreen.ScreenRoute);
  }

  void home() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.ScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _foromstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/001.png',
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "SIGN UP",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                  Text(
                    "Welcome Here you can sign up ",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 18, color: kLightColor),
                  ),
                  const SizedBox(height: 45),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            final regex = RegExp(r'^[a-zA-Z0-9._]+$');
                            if (!regex.hasMatch(value)) {
                              return 'Please enter a valid username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                            prefixIcon: Icon(Icons.person, color: textColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            final emailRegex = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email, color: textColor),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password cannot be empty.';
                            }

                            // Regex for at least 8 characters, one letter, one number, and one special character
                            final regex = RegExp(
                                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                            if (!regex.hasMatch(value)) {
                              return 'Password must be at least 8 characters long\n and include letters, numbers,\n and special characters.';
                            }

                            return null; // Password is valid
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _isObscured,
                          decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.password, color: textColor),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                                icon: Icon(
                                    _isObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: iconColor),
                              ),
                              border: InputBorder.none,
                              hintText: "Password"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: MaterialButton(
                      onPressed: () {
                        if (_foromstate.currentState!.validate()) {
                          Navigator.pushNamed(context, HomeScreen.ScreenRoute);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Center(
                            child: Text(
                          "Sign up",
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member? ",
                        style: GoogleFonts.robotoCondensed(
                            color: textColor, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: openSigninScreen,
                        child: Text(
                          "Log in",
                          style: GoogleFonts.robotoCondensed(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
