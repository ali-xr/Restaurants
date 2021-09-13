import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant/deliverService/deliver.dart';

class DeliverService {
  final String? uidMeal;
  DeliverService({this.uidMeal});

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection("Deliver");

  Future writeFirestore(String rasm, String ism1, String ism2, String narxi,int raqam,
      {bool state = false}) async {
    return await _reference.doc(uidMeal).set({
      'rasm': rasm,
      'ism1': ism1,
      'ism2': ism2,
      'narxi': narxi,
      'raqam': raqam,
      
    });
  }

  Future deleteFirestore(String uidMeal) async {
    return await _reference
        .doc(uidMeal)
        .delete()
        .then((value) => print("Delete qilinde"))
        .catchError(
          (e) => print("Error $e"),
        );
  }

  List<Deliver> _addDatas(QuerySnapshot snap) {
    return snap.docs.map((doc) {
      return Deliver(
        rasm: doc['rasm'],
        ism1: doc['ism1'],
        ism2: doc['ism2'],
        narxi: doc['narxi'],
        raqam: doc['raqam'],
        
      );
    }).toList();
  }

  Stream<List<Deliver>> get orders {
    return _reference.snapshots().map(_addDatas);
  }
}
