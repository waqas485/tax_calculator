import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'home.dart';
import 'legal.dart';
import 'slabs.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final TextEditingController _emailController = TextEditingController();
  //final DatabaseReference _database = FirebaseDatabase.instance.ref();

  // List of widgets for each tab
  final List<Widget> _pages = const [
    HomeScreen(title: 'Home'),
    SlabScreen(title: 'Tax Slabs'),
    LegalScreen(title: 'Legal Information'),
  ];

  // Method to handle tab changes
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
///////////////////////////////////////////////

  // void _saveEmail() async {
  //   String email = _emailController.text.trim();
  //   if (email.isNotEmpty) {
  //     try {
  //       await _database.child('emails').push().set({'email': email});
  //       _emailController.clear();
  //     } catch (e) {
  //     }
  //   } else {
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // Show the popup dialog as soon as the home page is opened
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _showEmailDialog();
  //   });
  // }

  // Method to display email input dialog
  // void _showEmailDialog() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false, // Prevent closing without submitting
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Enter your email'),
  //         content: TextField(
  //           controller: _emailController,
  //           keyboardType: TextInputType.emailAddress,
  //           decoration: const InputDecoration(
  //             hintText: 'Email',
  //           ),
  //         ),
  //         actions: <Widget>[
  //           ElevatedButton(
  //             onPressed: () {
  //               _saveEmail();
  //               // Close the dialog on submit
  //               Navigator.of(context).pop();
  //               print('submit button of popup is pressed');
  //             },
  //             child: const Text('Submit'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Income Tax Calculator'),
      // ),
      body: _pages[
          _currentIndex], // Display the selected page based on current index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _currentIndex, // Keeps track of the currently selected tab
        onTap: _onItemTapped, // Handles tab selection
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: 'Slabs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.legend_toggle_sharp),
            label: 'Legal',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}