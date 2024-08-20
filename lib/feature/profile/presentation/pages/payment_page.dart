import 'package:flutter/material.dart';
import 'package:majeat_driver/core/constants/theme_constants.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.bakcGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Payment Methods'),
        actions: const [
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 30.0),
           child:  Text(
            "💵",
            style: TextStyle(color: ThemeConstants.accentColor),
          ),
         ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PaymentMethodTile(
              iconData: Icons.credit_card,
              title: 'Santim Pay',
              subtitle: 'Expires 07/25',
              onTap: () {
                // Handle tap on this payment method
              },
              onDelete: () {
                // Handle deletion of this payment method
              },
            ),
            PaymentMethodTile(
              iconData: Icons.credit_card,
              title: 'Chapa Integration',
              subtitle: 'Expires 07/25',
              onTap: () {
                // Handle tap on this payment method
              },
              onDelete: () {
                // Handle deletion of this payment method
              },
            ),
            PaymentMethodTile(
              iconData: Icons.credit_card,
              title: 'TeleBirr +25197*****6',
              subtitle: 'Expires 09/26',
              onTap: () {
                // Handle tap on this payment method
              },
              onDelete: () {
                // Handle deletion of this payment method
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.add, color: Colors.green),
              title: const Text('Add Payment Method'),
              onTap: () {
                // Navigate to add payment method screen or show modal dialog
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const PaymentMethodTile({
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(iconData, color: ThemeConstants.primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: onTap,
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
