import 'package:flutter/material.dart';

//// legal Screen Started here
class LegalScreen extends StatefulWidget {
  const LegalScreen({super.key, required this.title});
  final String title;

  @override
  State<LegalScreen> createState() => _LegalScreenState();
}

class _LegalScreenState extends State<LegalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(50.0), // Sets the height of the AppBar
          child: AppBar(
            backgroundColor: const Color.fromARGB(
                255, 0, 35, 65), // Sets the background color
            title: Text(
              widget.title,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20, // Font size for the heading
                fontWeight: FontWeight.bold, // Bold text for heading
              ),
            ),
            //centerTitle: true, // Centers the title (optional)
          ),
        ),
        body: Container(
            margin: const EdgeInsets.all(8.0),
          //padding:const EdgeInsets.all(10.0), // Adds padding inside the container
          //margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: const BoxDecoration(
              //border: Border.all(color: Colors.black,)
              ),
          //child: const Center(
          child: SingleChildScrollView(
            //padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Header
                // const Text(
                //   "Legal Terms & Policies",
                //   style: TextStyle(
                //     fontFamily: 'Helvetica',
                //     color: Color.fromARGB(255, 0, 0, 0),
                //     fontSize: 22, // Font size for the heading
                //     fontWeight: FontWeight.bold, // Bold text for heading
                //   ),
                // ),
                // const SizedBox(height: 8.0),
                // Content Column without ListView
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Legal Terms & Policies Header
                    const Text(
                      "Legal Terms & Policies",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    // Legal Terms & Policies Content
                    const Text(
                      "By using this app you are agreeing to be bound by these terms of service, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using this app.",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),

                    // Disclaimer Header
                    const Text(
                      "Disclaimer",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    // Disclaimer Content
                    const Text(
                      "The materials on this app are provided on an 'as is' basis. This app makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),

                    // Privacy Policy Link
                    GestureDetector(
                      onTap: () {
                        // Handle Privacy Policy link tap here
                        print("Privacy Policy tapped");
                      },
                      child: const Text(
                        "Privacy Policy",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "v1.1.2",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //  )
        ));
  }
}
