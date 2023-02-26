import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreProducts {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Category');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('BestSelling');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productCollectionRef.get();

    return value.docs;
  }
}
