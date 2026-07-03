import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction_model.dart';
import '../utils/app_colors.dart';

class TransactionCard extends StatelessWidget {
  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "success":
        return AppColors.success;

      case "pending":
        return Colors.orange;

      case "failed":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  final TransactionModel transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    final firstItem = transaction.items.first;

    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withOpacity(.15),
          child: const Icon(
            Icons.shopping_bag_rounded,
            color: AppColors.primary,
          ),
        ),
        title: Text(
          firstItem.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat('dd MMM yyyy • HH:mm').format(transaction.createdAt),
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              currency.format(transaction.total),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              transaction.status,
              style: TextStyle(
                color: getStatusColor(transaction.status),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
