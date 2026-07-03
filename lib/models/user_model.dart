class UserModel {
  final String uid;
  final String name;
  final String email;
  final int balance;
  final String pin;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.balance,
    required this.pin,
  });

  factory UserModel.fromFirestore(String id, Map<String, dynamic> data) {
    return UserModel(
      uid: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      balance: data['balance'] ?? 0,
      pin: data['pin'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'balance': balance, 'pin': pin};
  }
}
