import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class Signup {
  static Future<void> signUp(String name, String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await _firestore.collection('email_user').doc(authResult.user.uid).set({
        'name': name,
        'email': email,
        'password': password,
        'date': DateTime.now(),
        'time': Timestamp.now(),
      });
    } on FirebaseAuthException catch (error) {
      print(error);
    }
  }
}
