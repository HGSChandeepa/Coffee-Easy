import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newappdemo/models/brew.dart';

class DatabaseService {
  //uid
  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference _brewCollection =
      FirebaseFirestore.instance.collection("berws");

  //the brew list from the snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Brew(
        name: data['name'] ?? '',
        sugars: data['sugars'] ?? 0,
        strength: data['strength'] ?? '0',
      );
    }).toList();
  }

  //streanm for any database document changes
  Stream<List<Brew>?> get brews {
    return _brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //this function will create a new brew for the newlly registerinfg user
  //here this function will also can be used to update the user belonging data
  Future updateUserData(String sugars, String name, int strength) async {
    //this will set the user entered values and store then in the brew collecction
    return await _brewCollection.doc(uid).set({
      "sugars": sugars,
      "name": name,
      "strength": strength,
    });
  }
}
