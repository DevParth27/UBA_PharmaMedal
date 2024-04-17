import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C2D4F), // Primary background color
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFCCA8E1), // Secondary gradient color
                    Color(0xFF4C2D4F), // Primary gradient color
                  ],
                  stops: [0, 1],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 28, 32, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'My',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF8CD0B), // Accent color
                              fontSize: 31,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: 'Pharmacy',
                            style: TextStyle(
                              color: Color(0xFFE4E8EA), // Secondary text color
                              fontWeight: FontWeight.w800,
                              fontSize: 31,
                            ),
                          ),
                        ],
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      '"The pharmacist is a key player in healthcare, bridging the gap between the physician\'s prescription and the patient\'s needs."',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFFF8F8F9), // Secondary text color
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 44, vertical: 12),
                        backgroundColor:
                            const Color(0xFFE8BE06), // Accent color
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Get Started'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
