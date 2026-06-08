import 'package:flutter/material.dart';
import 'package:kalan/utils/theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildFilterBar(context),
            Expanded(child: _buildGrid(context)),
            _buildApplyButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Food Category', style: AppTypography.display(context, color: AppColors.white, fontSize: 32)),
          const SizedBox(height: 8),
          Text('Explore the best meals around you.', style: AppTypography.body(context, color: AppColors.light)),
        ],
      ),
    );
  }

  Widget _buildFilterBar(BuildContext context) {
    final filters = ['Price', 'Rating', 'Distance'];
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: filters.map((f) => Chip(
          label: Row(
            children: [
              Text(f, style: AppTypography.body(context, fontSize: 12)),
              const SizedBox(width: 4),
              const Icon(LucideIcons.chevronDown, size: 14),
            ],
          ),
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
            side: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    final items = [
      {'name': 'Cheese Burger', 'price': '\$12.99', 'img': 'burger'},
      {'name': 'Pepperoni Pizza', 'price': '\$14.99', 'img': 'pizza'},
      {'name': 'Pasta Bolognese', 'price': '\$10.50', 'img': 'pasta'},
      {'name': 'Caesar Salad', 'price': '\$8.00', 'img': 'salad'},
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/product'),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      'https://source.unsplash.com/400x300/?${item['img']},food',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['name']!, style: AppTypography.display(context, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Text(item['price']!, style: AppTypography.price(context, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildApplyButton(BuildContext context) {
    return Container(
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
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
          ),
          onPressed: () {},
          child: Text('Apply Filter', style: AppTypography.body(context, color: AppColors.white)),
        ),
      ),
    );
  }
}
