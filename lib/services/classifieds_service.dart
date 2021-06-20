import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ClassifiedsService {
  final _oneDay = 86400000000;
  final _auth = FirebaseAuth.instance;
  final _database = FirebaseDatabase.instance.reference();

  /* Check if ads are available in the pool
  returns <number of ads available>
  */
  Future<int> isAdAvailable() async {
    Map<String, dynamic> appSettings = await getAppSettings();
    return appSettings["adPool"];
  }

  /* Return true if ad cleaning is successful (ad older than 9 days are available)else false
  */
  Future<bool> mineAd() {
    return _database
        .child("3classifieds")
        .orderByChild("timestamp")
        .endAt(new DateTime.now().microsecondsSinceEpoch - 9 * _oneDay)
        .limitToFirst(2)
        .once()
        .then((value) {
      Map<dynamic, dynamic> data = value.value;
      if (data != null) {
        data.forEach((key, value) {
          log("removing ad id: " + key);
          removeAdvertisement(key);
        });
        return true;
      }
      return false;
    });
  }

  // helper function to get appSettings appSettings = jsonDecode(value.toString())
  Future<Map> getAppSettings() async {
    Map<String, dynamic> appSettings;
    await _database.child("3appSettings").get().then(
        (value) => {appSettings = Map<String, dynamic>.from(value.value)});
    return appSettings;
  }

  //reduce ad pool by one (if -1,0 do nothing) -1 denotes unlimited ads
  decrementAdPool() async {
    final TransactionResult transactionResult = await _database
        .child("3appSettings/adPool")
        .runTransaction((MutableData mutableData) async {
      if (mutableData.value != -1) {
        log("decrementing ad");
        mutableData.value = mutableData.value == 0 ? 0 : mutableData.value - 1;
      }
      return mutableData;
    });
  }

  //increment ad pool by one (if -1 do nothing) -1 denotes unlimited ads
  incrementAdPool() async {
    final TransactionResult transactionResult = await _database
        .child("3appSettings/adPool")
        .runTransaction((MutableData mutableData) async {
      log("incrementing ad");
      if (mutableData.value != -1) {
        mutableData.value = mutableData.value + 1;
      }
      return mutableData;
    });
  }
  //helper function to remove old ads
  removeAdvertisement(key) {
    _database
        .child("3classifieds")
        .child(key)
        .remove()
        .then((value) => incrementAdPool());
    //TODO: Delete photos from bucket
  }
}
