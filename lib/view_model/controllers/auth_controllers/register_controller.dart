import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tech_media/utils/utils.dart';

class RegisterController with ChangeNotifier {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('Users');
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void registerUser(String userName, String userEmail, String password) async {
    setLoading(true);
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(email: userEmail, password: password)
          .then((value) {
        _databaseReference.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'username': userName,
          'email': value.user!.email.toString(),
          'onlineStatus': 'noOne',
          'phoneNumber': '',
          'profileImage': ''
        }).then((value) {
          setLoading(false);
        }).onError((error, stackTrace) {
          setLoading(false);
          Utils.toastMessage('Error: ${error.toString()}');
        });

        setLoading(false);
        Utils.toastMessage('User created successfully');
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage('Error: ${error.toString()}');
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
}
