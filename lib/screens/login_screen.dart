import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/screens/home_screen.dart';
import 'package:podcast_app/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const ScreenRoute = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;
  GlobalKey<FormState> _foromstate = GlobalKey();
  final regex = RegExp(r'^[a-zA-Z0-9._]+$');

  void openSignupScreen() {
    Navigator.of(context).pushReplacementNamed(SignupScreen.ScreenRoute);
  }

  void home() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.ScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
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
                  SizedBox(height: 20),
                  Text(
                    "SIGN IN",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Welcome back Nice to see you again",
                    style: GoogleFonts.robotoCondensed(fontSize: 18),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
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
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password cannot be empty.';
                            }

                            // Regex for at least 8 characters, one letter, one number, and one special character
                            final regex = RegExp(
                                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                            if (!regex.hasMatch(value)) {
                              return 'Please enter a valid Password';
                            }

                            return null; // Password is valid
                          },
                          obscureText: _isObscured,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.password),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                                icon: Icon(_isObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              border: InputBorder.none,
                              hintText: "Password"),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: MaterialButton(
                      onPressed: () {
                        if (_foromstate.currentState!.validate()) {
                          Navigator.pushNamed(context, HomeScreen.ScreenRoute);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                            child: Text(
                          "Sign IN",
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 171, 19, 95),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not yet a member? ",
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: openSignupScreen,
                        child: Text(
                          "Sign up Now",
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.red, fontWeight: FontWeight.bold),
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
