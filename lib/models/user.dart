import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:ur_buddy_3/models/classified.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String hostelAddress;
  final String phoneNumber;
  final List<Classified> onSaleProducts;

  User(
    this.id,
    this.name,
    this.email,{
    this.hostelAddress,
    this.phoneNumber,
    this.onSaleProducts,
  });
}

class UserProvider with ChangeNotifier {
  User _user;
  final ref = FirebaseDatabase.instance.reference();

  User get user {
    return _user;
  }

  Future<void> fetchAndSetUser(uid) async {
    try {
      final result = await ref.child("3users/$uid").get();
      final LinkedHashMap bodyMap = result.value;
      _user = User(
        uid,
        bodyMap["name"],
        bodyMap["email"],
      );
      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }
}
