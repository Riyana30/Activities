// m2.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google/firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

// Run | Debug | Profile
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// Main App Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner
      home: LoginScreen(), // First screen when app launches
    ); // MaterialApp
  }
}

// Login Screen Widget
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase authentication instance
  final GoogleSignIn _googleSignIn = GoogleSignIn(); // Google Sign-In Instance

  // Function to handle Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      // Trigger the Google sign-in prompt
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return; // if user cancels login, return

      // Retrieve authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a credential to sign in to Firebase
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase using the obtained credentials
      await _auth.signInWithCredential(credential);

      // Navigate to HomeScreen after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => HomeScreen(),
        ),
      );
    } catch (e) {
      print('Object: "Sign-in error: $e"'); // Print error if login fails
    }
  }

  // Function to handle sign-out
  Future<void> signOut() async {
    await _googleSignIn.signOut(); // Sign out from Google account
    await _auth.signOut(); // Sign out from Firebase authentication
    setState(() {}); // Update UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent, // AppBar background color
        title: Text( "Google Sign-In"), // AppBar title
        centerTitle: true, // Center align title
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: <Widget>[
            // Google Sign-In Button
            ElevatedButton(
              onPressed: signInWithGoogle, // Calls Google Sign-In function
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color green
                foregroundColor: Colors.white, // Text color white
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button padding
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Button text styling
              ),
              child: Text( "Sign in with Google"), // Button text
            ), // ElevatedButton
          ],
        ),
      ), // Center
    ); // Scaffold
  }
}

extension on GoogleSignIn {
}

extension on GoogleSignInAuthentication {
}

// HomeScreen after successful login
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // AppBar background color
        title: Text( "Home"), // AppBar title
        centerTitle: true, // Center align title
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: <Widget>[
            // Text displayed when signed in
            Text(
              "You are signed in!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Text styling
            ), // Text
            SizedBox(height: 20), // Adds space between text and button

            // Sign Out Button
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut(); // Sign out from Firebase
                await GoogleSignIn().signOut(); // Sign out from Google
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => LoginScreen(), // Redirects back to login screen
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Button color red
                foregroundColor: Colors.white, // Text color white
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button padding
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Button text styling
              ),
              child: Text( "Sign Out"), // Button text
            ), // ElevatedButton
          ],
        ),
      ), // Center
    ); // Scaffold
  }
}