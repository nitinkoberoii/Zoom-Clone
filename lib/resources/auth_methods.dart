import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/utils/utils.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import '../screens/login_screen.dart';

String hashPassword(String password) {
  final bytes = utf8.encode(password);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  // Sign In with Google
  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      res = false;
    }
    return res;
  }

  //email validator
  bool isEmailValid(String email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(email);
  }

  // SignUp with Email/Password
  Future<bool> signupWithEmailAndPassword(
      BuildContext context,
      TextEditingController emailAddressController,
      TextEditingController nameController,
      TextEditingController passwordController) async {
    bool res = false;

    String emailAddress = emailAddressController.text.trim();
    String name = nameController.text.trim();
    String password = passwordController.text.trim();

    if (!isEmailValid(emailAddress)) {
      showSnackBar(context, 'Wrong Email');
      return res;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': name,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
            'password': hashPassword(password),
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      } else {
        showSnackBar(context, e.message!);
      }
      res = false;
    } catch (e) {
      print(e);
      res = false;
    }
    return res;
  }

  // SignIn with Email/Password
  Future<bool> signInWithEmailAndPassword(
      BuildContext context,
      TextEditingController emailAddressController,
      TextEditingController passwordController) async {
    bool res = false;

    String emailAddress = emailAddressController.text.trim();
    String password = passwordController.text.trim();

    if (!isEmailValid(emailAddress)) {
      showSnackBar(context, 'Wrong Email');
      return res;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
            'password': hashPassword(password),
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      } else {
        showSnackBar(context, e.message!);
      }
      res = false;
    } catch (e) {
      print(e);
      res = false;
    }
    return res;
  }

  void signOut(BuildContext context) async {
    try {
      _auth.signOut();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    } catch (e) {
      print(e);
    }
  }
}
