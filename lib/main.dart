import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screens/home_screen.dart';
import 'package:zoom_clone/screens/join_without_signIn.dart';
import 'package:zoom_clone/screens/login_screen.dart';
import 'package:zoom_clone/screens/settings_screen.dart';
import 'package:zoom_clone/screens/sign-up_screens/sign_up_screen1.dart';
import 'package:zoom_clone/screens/sign-up_screens/sign_up_screen2.dart';
import 'package:zoom_clone/screens/sign_in_screen.dart';
import 'package:zoom_clone/screens/video_call_screen.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // found in google-services.json
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyBQvQDCdKhgkosISGWY0SZPBZF8HDSXVuI',
            appId: '1:224328311701:android:129d3911e294f5ed660c9c',
            messagingSenderId: '224328311701',
            projectId: 'zoom-clone-ea91d',
          ),
        )
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/video-call': (context) => const VideoCallScreen(),
        '/join-meeting-without-signIn': (context) => const JoinWithoutSignin(),
        '/settings': (context) => const SettingsScreen(),
        '/sign-up/#': (context) => const SignUpScreen1(),
        '/sign-up/auth': (context) => const SignUpScreen2(),
        '/sign-in': (context) => const SignInScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return SplashScreenView(
            duration: 3000,
            text: "zoom",
            textStyle: const TextStyle(
                fontFamily: 'PlaywriteITTrad',
                fontSize: 70,
                fontWeight: FontWeight.bold),
            navigateRoute: const LoginScreen(),
          );
        },
      ),
    );
  }
}
