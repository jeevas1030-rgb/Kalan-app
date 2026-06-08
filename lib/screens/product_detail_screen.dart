import 'package:flutter/material.dart';
import 'package:kalan/utils/theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageAndStats(context),
                    const SizedBox(height: 24),
                    _buildDetails(context),
                    const SizedBox(height: 24),
                    _buildToppings(context),
                  ],
                ),
              ),
            ),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
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
          const Icon(LucideIcons.heart, color: AppColors.primary, size: 24), // Heart should be yellow/orange filled
        ],
      ),
    );
  }

  Widget _buildImageAndStats(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ClipOval(
            child: Image.network(
              'https://source.unsplash.com/600x600/?salad,bowl',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(LucideIcons.star, color: AppColors.primary, size: 16),
                    const SizedBox(width: 8),
                    Text('5.0', style: AppTypography.display(context, fontSize: 14)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: [
                    BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6)),
                  ],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () { if (_quantity > 1) setState(() => _quantity--); },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('-', style: TextStyle(fontSize: 18, color: AppColors.dark, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Text('0$_quantity', style: AppTypography.display(context, color: AppColors.dark, fontSize: 16)),
                    GestureDetector(
                      onTap: () => setState(() => _quantity++),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('+', style: TextStyle(fontSize: 18, color: AppColors.dark, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text('Spicy Chicken\nRicemix', style: AppTypography.display(context, fontSize: 24, fontWeight: FontWeight.w800)),
              ),
              Row(
                children: [
                  const Icon(LucideIcons.clock, color: AppColors.danger, size: 16),
                  const SizedBox(width: 4),
                  Text('10-15 Mins', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Grilled meat skewers, shish kebab and healthy to vegetable salad of fresh tomato cucumbe.',
            style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 13),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildToppings(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Toping for you', style: AppTypography.display(context, fontSize: 16)),
              Text('Clear', style: AppTypography.body(context, color: AppColors.danger, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 70,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            scrollDirection: Axis.horizontal,
            children: [
              _buildToppingItem('https://source.unsplash.com/100x100/?meat', true),
              const SizedBox(width: 12),
              _buildToppingItem('https://source.unsplash.com/100x100/?broccoli', false),
              const SizedBox(width: 12),
              _buildToppingItem('https://source.unsplash.com/100x100/?onion', null),
              const SizedBox(width: 12),
              _buildToppingItem('https://source.unsplash.com/100x100/?tomato', null),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToppingItem(String imgUrl, bool? isAdded) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Image.network(imgUrl, width: 40, height: 40, fit: BoxFit.contain),
          ),
        ),
        if (isAdded != null)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isAdded ? AppColors.dark : AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isAdded ? LucideIcons.plus : LucideIcons.minus,
                color: isAdded ? AppColors.white : AppColors.dark,
                size: 10,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Total Price', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 12)),
              Row(
                children: [
                  Text('\$', style: AppTypography.display(context, color: AppColors.primary, fontSize: 20)),
                  Text(' 36.00', style: AppTypography.display(context, fontSize: 24, fontWeight: FontWeight.w800)),
                ],
              ),
            ],
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.dark,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            icon: const Icon(LucideIcons.shoppingCart, size: 18),
            label: Text('Go To Cart', style: AppTypography.body(context, color: AppColors.white, fontWeight: FontWeight.w600)),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
    );
  }
}
