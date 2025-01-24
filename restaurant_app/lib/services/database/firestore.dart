//correr lo diguiente flutter pub add cloud_firestore
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection of orders
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');
  //save order to DB
  Future<void> saveOrderToDataBase(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'order': receipt,
      //add more fields as necesary
    });
  }
}