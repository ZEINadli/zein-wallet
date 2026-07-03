import 'package:flutter/material.dart';

import '../../models/transaction_model.dart';
import '../../models/user_model.dart';
import '../../services/auth_service.dart';
import '../../services/firestore_service.dart';
import '../../utils/routes.dart';
import '../../widgets/balance_card.dart';
import '../../widgets/transaction_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirestoreService();
    final auth = AuthService();

    // Palette warna tema wallet / clothes brand premium langsung di sini
    const colorBackground = Color(0xFF1E2022); // Charcoal gelap elegan
    const colorTextPrimary = Color(0xFFF5F5F7); // Broken white / light grey
    // const colorTextSecondary = Color(0Header8E8E93);  // Muted grey untuk info sekunder
    const colorAccent = Color(
      0xFFC4A484,
    ); // Light Leather Tan / Estetik Apparel

    return Scaffold(
      backgroundColor: colorBackground,

      appBar: AppBar(
        backgroundColor: colorBackground,
        elevation: 0, // Biar gak ada bayangan kaku, menyatu sama background
        title: const Text(
          "Zein Wallet",
          style: TextStyle(
            color: colorTextPrimary,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await auth.logout();

              if (context.mounted) {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              }
            },
            icon: const Icon(Icons.logout, color: colorTextPrimary),
          ),
        ],
      ),

      body: StreamBuilder<UserModel>(
        stream: firestore.userStream(),

        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: colorAccent),
            );
          }

          if (!userSnapshot.hasData) {
            return const Center(
              child: Text(
                "User not found",
                style: TextStyle(color: Colors.amberAccent),
              ),
            );
          }

          final user = userSnapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(20),

            children: [
              BalanceCard(name: user.name, balance: user.balance),

              const SizedBox(height: 25),

              SizedBox(
                height: 54,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorAccent, // Warna tan kulit/pakaian
                    foregroundColor: const Color(
                      0xFF1E2022,
                    ), // Warna teks tombol kontras gelap
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // Sudut lebih rounded modern
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.topup);
                  },
                  icon: const Icon(Icons.add_circle_outline, size: 20),
                  label: const Text(
                    "Top Up Wallet",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Activity",
                    style: TextStyle(
                      color: colorTextPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.transaction);
                    },
                    style: TextButton.styleFrom(foregroundColor: colorAccent),
                    child: const Text(
                      "See All",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              StreamBuilder<List<TransactionModel>>(
                stream: firestore.transactionStream(),

                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: colorAccent),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Center(
                        child: Text(
                          "No transaction yet",
                          style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  }

                  final transactions = snapshot.data!;

                  return Column(
                    children: transactions
                        .take(5)
                        .map((e) => TransactionCard(transaction: e))
                        .toList(),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
