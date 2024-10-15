// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pharmacy/pages/otp_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _LoginPageState extends State<LoginPage> {
  Future<UserCredential?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        return await _auth.signInWithCredential(credential);
      } else {
        _showSnackBar('Google sign-in canceled.');
      }
    } catch (error) {
      print('Google sign-in error: $error');
      _showSnackBar(
          'An error occurred during Google sign-in. Please try again.');
    }
    return null;
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.04),
              SizedBox(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/health.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: height * 0.08),
              const Text(
                "Welcome to MedxPharmacy",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 35),
              Column(
                children: [
                  _buildSocialButton(
                    iconPath: 'images/svgs/google.svg',
                    text: 'Sign in with Google',
                    onPressed: () async {
                      Navigator.pushNamed(context, '/home');
                      // final userCredential = await _signInWithGoogle();
                      // if (userCredential != null) {
                      //   _showSnackBar(
                      //     'Authentication successful! Signed in as ${userCredential.user!.displayName}',
                      //   );
                      //   Navigator.pushNamed(context, '/home');
                      // }
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildSocialButton(
                    iconPath: 'images/svgs/phone.svg',
                    text: 'Sign in with Phone',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTPScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 38),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Welcome to Pharmacy! Enhancing your healthcare journey",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "फार्मसीमध्ये आपले स्वागत आहे! आम्ही तुमची आरोग्यसेवा आणखी सोपी करत आहोत.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                '© 2024 UBA. All rights reserved.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String iconPath,
    required String text,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 60,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
