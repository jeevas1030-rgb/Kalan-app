import 'package:flutter/material.dart';
import 'package:kalan/utils/theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Notifications', style: AppTypography.display(context, fontSize: 20)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Mark all as read', style: AppTypography.body(context, color: AppColors.primary, fontWeight: FontWeight.w400)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildNotification(context, 'Order Arrived!', 'Your order #KLN-84392 has arrived at your location.', LucideIcons.package, 'Just now', isUnread: true),
          const SizedBox(height: 16),
          _buildNotification(context, '50% OFF Promo', 'Use code KALAN50 to get 50% off your next order.', LucideIcons.tag, '2 hours ago', isUnread: true),
          const SizedBox(height: 16),
          _buildNotification(context, 'Order Confirmed', 'Your order #KLN-84391 has been confirmed.', LucideIcons.checkCircle, 'Yesterday'),
        ],
      ),
    );
  }

  Widget _buildNotification(BuildContext context, String title, String body, IconData icon, String time, {bool isUnread = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread ? AppColors.bg : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: isUnread ? Border.all(color: AppColors.light) : null,
        boxShadow: isUnread ? null : [
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
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUnread ? AppColors.white : AppColors.bg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: AppTypography.display(context, fontSize: 16)),
                    Text(time, style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(body, style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
