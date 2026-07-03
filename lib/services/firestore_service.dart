import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/transaction_model.dart';
import '../models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String get uid => FirebaseAuth.instance.currentUser!.uid;

  /// Ambil data user
  Future<UserModel> getUser() async {
    final doc = await _firestore.collection('users').doc(uid).get();

    if (!doc.exists || doc.data() == null) {
      throw Exception("User data not found.");
    }

    return UserModel.fromFirestore(doc.id, doc.data()!);
  }

  /// Stream data user
  Stream<UserModel> userStream() {
    return _firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .where((doc) => doc.exists && doc.data() != null)
        .map((doc) => UserModel.fromFirestore(doc.id, doc.data()!));
  }

  /// Stream transaksi milik user
  Stream<List<TransactionModel>> transactionStream() {
    return _firestore
        .collection('transactions')
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => TransactionModel.fromFirestore(doc.id, doc.data()))
              .toList(),
        );
  }
}
