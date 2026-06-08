import 'package:flutter/material.dart';
import 'package:kalan/utils/theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        title: Text('Profile', style: AppTypography.display(context, fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 32),
            _buildMenu(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.light,
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: NetworkImage('https://source.unsplash.com/100x100/?portrait,person'),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: AppColors.white, width: 4),
          ),
        ),
        const SizedBox(height: 16),
        Text('Jane Doe', style: AppTypography.display(context, fontSize: 24)),
        const SizedBox(height: 4),
        Text('jane.doe@example.com', style: AppTypography.body(context, color: AppColors.textMuted, fontWeight: FontWeight.w300)),
      ],
    );
  }

  Widget _buildMenu(BuildContext context) {
    final menuItems = [
      {'icon': LucideIcons.package, 'title': 'My Orders', 'route': '/tracking'},
      {'icon': LucideIcons.mapPin, 'title': 'Saved Addresses', 'route': null},
      {'icon': LucideIcons.creditCard, 'title': 'Payment Methods', 'route': '/payment'},
      {'icon': LucideIcons.bell, 'title': 'Notifications', 'route': '/notifications'},
      {'icon': LucideIcons.helpCircle, 'title': 'Help & Support', 'route': null},
    ];

    return Container(
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
      child: Column(
        children: [
          ...menuItems.map((item) => _buildMenuRow(
            context, 
            item['icon'] as IconData, 
            item['title'] as String,
            onTap: item['route'] != null ? () => Navigator.pushNamed(context, item['route'] as String) : null,
          )),
          _buildLogoutRow(context),
        ],
      ),
    );
  }

  Widget _buildMenuRow(BuildContext context, IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textPrimary, size: 20),
      title: Text(title, style: AppTypography.body(context)),
      trailing: const Icon(LucideIcons.chevronRight, color: AppColors.textMuted, size: 20),
      onTap: onTap,
    );
  }

  Widget _buildLogoutRow(BuildContext context) {
    return ListTile(
      title: Text('Logout', style: AppTypography.body(context, color: AppColors.danger)),
      onTap: () => Navigator.pushReplacementNamed(context, '/login'),
    );
  }
}
