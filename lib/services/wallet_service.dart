import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WalletService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String get uid => FirebaseAuth.instance.currentUser!.uid;

  Future<void> topUp(int amount) async {
    final userDoc = _firestore.collection('users').doc(uid);

    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDoc);

      if (!snapshot.exists) {
        throw Exception("User not found.");
      }

      final currentBalance = snapshot.data()?['balance'] ?? 0;

      transaction.update(userDoc, {'balance': currentBalance + amount});
    });

    await _firestore.collection('transactions').add({
      'uid': uid,
      'type': 'topup',
      'status': 'Success',
      'total': amount,
      'createdAt': FieldValue.serverTimestamp(),
      'items': [
        {
          'productId': 'TOPUP',
          'name': 'Wallet Top Up',
          'image': '',
          'price': amount,
          'qty': 1,
        },
      ],
    });
  }
}
