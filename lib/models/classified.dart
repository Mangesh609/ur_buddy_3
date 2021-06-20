import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ur_buddy_3/models/user.dart';

class Classified {
  final String id;
  final String title;
  final String subTitle;
  final String description;
  final String price;
  final String condition;
  final DateTime timeStamp;
  final User createdBy;
  // final User owner;

  Classified(
    this.id,
    this.title,
    this.subTitle,
    this.description,
    this.price,
    this.condition,
    this.timeStamp,
    this.createdBy,
    // this.owner,
  );
}

class ClassifiedsProvider with ChangeNotifier {
  List<Classified> _classifieds = [];


  final DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  List<Classified> get classifieds {
    return [..._classifieds];
  }

  List<Classified> get userClassifieds {
    final userId = fba.FirebaseAuth.instance.currentUser.uid;
    return _classifieds.where((classified) => classified.createdBy.id == userId).toList();
  }

  Future<void> fetchAndSetClassifieds() async {
    try {
      final result =
          await dbRef.child("3classifieds").orderByChild("timeStamp").get();
      final LinkedHashMap bodyMap = result.value;

      final List<Classified> classifieds = [];

      bodyMap.forEach((key, value) {
        final classified = Classified(
            key,
            value['title'],
            value['subTitle'],
            value['description'],
            value['price'],
            value['condition'],
            DateTime.parse(value['timeStamp']),
            User(value["createdBy"]["id"], value["createdBy"]["name"],
                value["createdBy"]["email"]));

        classifieds.add(classified);
      });

      _classifieds = classifieds;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }



  Future<void> addClassified(
      String title,
      String subTitle,
      String description,
      String price,
      String condition,
      DateTime timeStamp,
      BuildContext context) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      final obj = {
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "price": price,
        "condition": condition,
        "timeStamp": timeStamp.toString(),
        "createdBy": {"id": user.id, "name": user.name, "email": user.email}
      };

      final classifiedsResult = dbRef.child("3classifieds").push();

      await classifiedsResult.set(obj);

      final newClassified = Classified(classifiedsResult.key, title, subTitle,
          description, price, condition, timeStamp, user);

      _classifieds.insert(0, newClassified);

      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> deleteClassifiedFromId(String classifiedId) async{
    await dbRef.child("3classifieds/$classifiedId").remove();
    _classifieds.removeWhere((classified) => classified.id == classifiedId);
    notifyListeners();
  }
}
