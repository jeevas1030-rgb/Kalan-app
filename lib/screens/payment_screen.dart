import 'package:flutter/material.dart';
import 'package:kalan/utils/theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedMethod = 0;
  bool _showSuccess = false;

  @override
  Widget build(BuildContext context) {
    if (_showSuccess) return _buildSuccessScreen(context);

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Payment', style: AppTypography.display(context, fontSize: 20)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAddressCard(context),
                const SizedBox(height: 32),
                Text('Payment Method', style: AppTypography.display(context, fontSize: 18)),
                const SizedBox(height: 16),
                _buildPaymentTabs(context),
                const SizedBox(height: 24),
                _buildPaymentForm(context),
                const SizedBox(height: 32),
                _buildOrderSummary(context),
              ],
            ),
          ),
          _buildBottomCTA(context),
        ],
      ),
    );
  }

  Widget _buildAddressCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(LucideIcons.mapPin, color: AppColors.primary, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Home Address', style: AppTypography.body(context, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text('123 Main Street, Apt 4B\nNew York, NY 10001', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 14)),
              ],
            ),
          ),
          const Icon(LucideIcons.edit2, color: AppColors.primary, size: 20),
        ],
      ),
    );
  }

  Widget _buildPaymentTabs(BuildContext context) {
    final tabs = ['Card', 'UPI/Wallet', 'Cash'];
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = _selectedMethod == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedMethod = index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.light : Colors.transparent,
                  borderRadius: BorderRadius.circular(999),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[index], 
                  style: AppTypography.body(context, color: isSelected ? AppColors.primary : AppColors.textMuted, fontSize: 14)
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPaymentForm(BuildContext context) {
    if (_selectedMethod == 0) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            _buildInput(context, 'Card Number', '0000 0000 0000 0000'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildInput(context, 'Expiry Date', 'MM/YY')),
                const SizedBox(width: 16),
                Expanded(child: _buildInput(context, 'CVV', '123')),
              ],
            ),
          ],
        ),
      );
    } else if (_selectedMethod == 1) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: _buildInput(context, 'UPI ID', 'username@bank'),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text('Pay with cash when your order is delivered.', style: AppTypography.body(context, color: AppColors.textMuted)),
      );
    }
  }

  Widget _buildInput(BuildContext context, String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.body(context, fontSize: 12, color: AppColors.textMuted)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: AppTypography.body(context, color: const Color(0xFFD1D5DB)),
              border: InputBorder.none,
            ),
            style: AppTypography.body(context),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummary(BuildContext context) {
    return ExpansionTile(
      title: Text('Order Summary', style: AppTypography.display(context, fontSize: 16)),
      childrenPadding: const EdgeInsets.all(16),
      collapsedBackgroundColor: AppColors.white,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1x Classic Cheese Burger', style: AppTypography.body(context, color: AppColors.textMuted)),
            Text('\$12.99', style: AppTypography.price(context, fontSize: 14)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('2x French Fries', style: AppTypography.body(context, color: AppColors.textMuted)),
            Text('\$9.00', style: AppTypography.price(context, fontSize: 14)),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomCTA(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
            ),
            onPressed: () {
              setState(() => _showSuccess = true);
            },
            child: Text('Pay \$23.99', style: AppTypography.body(context, color: AppColors.white)),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(LucideIcons.checkCircle2, color: AppColors.primary, size: 64),
              ),
              const SizedBox(height: 32),
              Text('Order Placed!', style: AppTypography.display(context, fontSize: 32)),
              const SizedBox(height: 8),
              Text('Your order ID is #KLN-84392', style: AppTypography.body(context, color: AppColors.textMuted)),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                  ),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/tracking'),
                  child: Text('Track Order', style: AppTypography.body(context, color: AppColors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
