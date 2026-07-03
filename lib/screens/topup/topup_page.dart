import 'package:flutter/material.dart';

import '../../services/wallet_service.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  final TextEditingController _amountController = TextEditingController();

  final WalletService _walletService = WalletService();

  bool _loading = false;

  int _selectedAmount = 0;

  final List<int> amounts = [100000, 500000, 1000000, 5000000];

  Future<void> _topUp() async {
    final amount = int.tryParse(_amountController.text) ?? 0;

    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid amount.")),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      await _walletService.topUp(amount);

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Top up successful.")));

      Navigator.pop(context);
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Top up failed."),
        ),
      );
    }

    if (mounted) {
      setState(() => _loading = false);
    }
  }

  Widget amountButton(int amount) {
    final selected = amount == _selectedAmount;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAmount = amount;
          _amountController.text = amount.toString();
        });
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            "Rp ${amount.toString()}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text("Top Up Wallet")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose Amount",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: amounts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                return amountButton(amounts[index]);
              },
            ),

            const SizedBox(height: 30),

            const Text(
              "Custom Amount",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            CustomTextField(
              controller: _amountController,
              hint: "Example : 100000",
              icon: Icons.payments,
              keyboardType: TextInputType.number,
            ),

            const Spacer(),

            _loading
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
                    text: "Top Up",
                    icon: Icons.account_balance_wallet,
                    onPressed: _topUp,
                  ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
