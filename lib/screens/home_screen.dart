import 'package:flutter/material.dart';
import 'package:kalan/utils/theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120), // space for floating nav
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(context),
              _buildSearchBar(context),
              _buildCategories(context),
              const SizedBox(height: 24),
              _buildPopularItems(context),
              const SizedBox(height: 32),
              _buildFavoriteRestaurants(context),
            ],
          ),
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
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: const Icon(LucideIcons.menu, color: AppColors.textPrimary, size: 20),
          ),
          Text('Search Food', style: AppTypography.display(context, fontSize: 18)),
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://source.unsplash.com/100x100/?portrait,man'),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Row(
                children: [
                  const Icon(LucideIcons.search, color: AppColors.textMuted, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Healty Food',
                        hintStyle: AppTypography.body(context, color: AppColors.textPrimary),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: const Icon(LucideIcons.slidersHorizontal, color: AppColors.textPrimary, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24.0),
      child: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildCategoryChip(context, 'Fast Food', true, '🍕'),
            const SizedBox(width: 12),
            _buildCategoryChip(context, 'Fruites', false, '🍓'),
            const SizedBox(width: 12),
            _buildCategoryChip(context, 'Drinks', false, '🍹'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label, bool isSelected, String emoji) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.circular(999),
        boxShadow: isSelected ? [
          BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6))
        ] : [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
            child: Text(emoji, style: const TextStyle(fontSize: 14)),
          ),
          const SizedBox(width: 8),
          Text(label, style: AppTypography.body(context, color: isSelected ? AppColors.white : AppColors.textMuted, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400)),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget _buildPopularItems(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        scrollDirection: Axis.horizontal,
        children: [
          _buildItemCard(context, 'Grilled skewers', 'Spicy mutton', '\$36.00', 'https://source.unsplash.com/200x200/?skewer,meat', true),
          const SizedBox(width: 16),
          _buildItemCard(context, 'Thai Spaghetti', 'Fresh Tomato', '\$12.00', 'https://source.unsplash.com/200x200/?spaghetti,pasta', false),
        ],
      ),
    );
  }

  Widget _buildItemCard(BuildContext context, String title, String subtitle, String price, String imgUrl, bool isFavorite) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipOval(
                child: Image.network(imgUrl, width: 100, height: 100, fit: BoxFit.cover),
              ),
            ),
            const Spacer(),
            Text(title, style: AppTypography.display(context, fontSize: 14)),
            const SizedBox(height: 4),
            Text(subtitle, style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 11)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: AppTypography.price(context, fontSize: 16)),
                Icon(
                  isFavorite ? LucideIcons.heart : LucideIcons.heart, // filled vs outline ideally
                  color: isFavorite ? AppColors.danger : AppColors.textPrimary,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteRestaurants(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Favorite Restaurants', style: AppTypography.display(context, fontSize: 16)),
              Text('See all', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRestaurantCard(context, 'Foodcave Restaurants', 'New York, Australia'), // matching the weird image typo
                const SizedBox(width: 16),
                _buildRestaurantCard(context, 'Downtown Resto', 'New York, USA'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(BuildContext context, String title, String location) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.network('https://source.unsplash.com/80x80/?restaurant,food', width: 56, height: 56, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: AppTypography.display(context, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(5, (index) => const Icon(LucideIcons.star, color: AppColors.primary, size: 10)),
                ),
                const SizedBox(height: 4),
                Text(location, style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
