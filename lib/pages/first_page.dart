import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF4C2D4F), // Primary background color
      body: Stack(
        children: [
          // Main Gradient Background at Bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenSize.height * 0.52,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(
                        255, 136, 103, 156), // Secondary gradient color
                    Color(0xFF4C2D4F), // Primary gradient color
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Main Title RichText
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'My',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF8CD0B), // Accent color
                              fontSize: 31,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Pharmacy',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFE4E8EA), // Secondary text color
                              fontWeight: FontWeight.bold,
                              fontSize: 31,
                            ),
                          ),
                        ],
                        style: TextStyle(
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),

                    // Subtitle Quote
                    const Text(
                      '"The pharmacist is a key player in healthcare, bridging the gap between the physician\'s prescription and the patient\'s needs."',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFFF8F8F9), // Secondary text color
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        height: 1.5, // Line height for better readability
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '"फार्मासिस्ट हा आरोग्यसेवेमधील महत्त्वाचा घटक आहे, जो डॉक्टरांच्या प्रिस्क्रिप्शन आणि रुग्णांच्या गरजांमधील अंतर कमी करतो."',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFFF8F8F9), // Secondary text color
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        height: 1.5, // Line height for better readability
                      ),
                    ),
                    const SizedBox(height: 25),

                    // "Get Started" Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 44,
                          vertical: 14,
                        ),
                        backgroundColor:
                            const Color(0xFFE8BE06), // Accent color
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 6, // Elevation for button effect
                        shadowColor: Colors.black38,
                      ),
                      child: const Text(
                        'Get Started',
                      ),
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
