class TransactionItem {
  final String productId;
  final String name;
  final String image;
  final int price;
  final int qty;

  TransactionItem({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.qty,
  });

  factory TransactionItem.fromMap(Map<String, dynamic> map) {
    return TransactionItem(
      productId: map['productId'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? 0,
      qty: map['qty'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'price': price,
      'qty': qty,
    };
  }
}

class TransactionModel {
  final String id;
  final String uid;
  final int total;
  final String status;
  final String type;
  final DateTime createdAt;
  final List<TransactionItem> items;

  TransactionModel({
    required this.id,
    required this.uid,
    required this.total,
    required this.status,
    required this.type,
    required this.createdAt,
    required this.items,
  });

  factory TransactionModel.fromFirestore(String id, Map<String, dynamic> data) {
    return TransactionModel(
      id: id,
      uid: data['uid'] ?? '',
      total: data['total'] ?? 0,
      status: data['status'] ?? '',
      type: data['type'] ?? 'purchase',
      createdAt: data['createdAt'].toDate(),
      items: (data['items'] as List<dynamic>? ?? [])
          .map((e) => TransactionItem.fromMap(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'total': total,
      'status': status,
      'type': type,
      'createdAt': createdAt,
      'items': items.map((e) => e.toMap()).toList(),
    };
  }
}
