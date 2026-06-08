import 'package:flutter/material.dart';
import 'package:kalan/utils/theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Text('My\nCart List', style: AppTypography.display(context, fontSize: 32, fontWeight: FontWeight.w800)),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCartItem(context, 'Grilled skewers', '\$13.99', 2, 'https://source.unsplash.com/100x100/?skewer,meat'),
                    const SizedBox(height: 24),
                    _buildCartItem(context, 'Thai Spaghetti', '\$30.99', 2, 'https://source.unsplash.com/100x100/?spaghetti,pasta'),
                    const SizedBox(height: 32),
                    _buildDiscountCode(context),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            _buildBottomSheet(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary, size: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: const Icon(LucideIcons.trash2, color: AppColors.textPrimary, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, String name, String price, int qty, String imgUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(imgUrl, width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTypography.display(context, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(price, style: AppTypography.display(context, fontSize: 14)),
                    const SizedBox(width: 8),
                    Text('x$qty', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.dark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: const [
                Icon(LucideIcons.plus, color: AppColors.white, size: 14),
                SizedBox(height: 8),
                Icon(LucideIcons.minus, color: AppColors.white, size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountCode(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(LucideIcons.badgePercent, color: AppColors.danger, size: 20),
        const SizedBox(width: 8),
        Text('Do you have any discount code?', style: AppTypography.body(context, color: AppColors.textPrimary)),
      ],
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSummaryRow(context, 'Subtotal', '\$ 96.00'),
          const SizedBox(height: 12),
          _buildSummaryRow(context, 'Est.Tax', '2.00'),
          const SizedBox(height: 12),
          _buildSummaryRow(context, 'Delivery', 'Free'),
          const SizedBox(height: 24),
          const Divider(color: Color(0xFFE5E7EB), thickness: 1, height: 1), // Ideally dashed, but solid works for now
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: AppTypography.display(context, fontSize: 18)),
              Text('\$ 98.00', style: AppTypography.display(context, fontSize: 18, fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 0,
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Checkout', style: AppTypography.body(context, color: AppColors.dark, fontWeight: FontWeight.w600, fontSize: 16)),
                  const SizedBox(width: 8),
                  const Icon(LucideIcons.arrowRight, color: AppColors.dark, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTypography.body(context, color: AppColors.textMuted)),
        Text(value, style: AppTypography.body(context, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
