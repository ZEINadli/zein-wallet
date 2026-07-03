import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/app_colors.dart';

class BalanceCard extends StatelessWidget {
  final String name;
  final int balance;

  const BalanceCard({super.key, required this.name, required this.balance});

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(
      locale: "id_ID",
      symbol: "Rp ",
      decimalDigits: 0,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.primary.withOpacity(.4)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(.15),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.account_balance_wallet_rounded,
                color: AppColors.primary,
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                "Available Balance",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Text(
            currency.format(balance),
            style: const TextStyle(
              fontSize: 33,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          const Divider(),

          const SizedBox(height: 12),

          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.person, color: Colors.white),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Marketplace Connected",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.verified, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
