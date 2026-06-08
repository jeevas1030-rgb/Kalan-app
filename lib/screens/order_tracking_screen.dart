import 'package:flutter/material.dart';
import 'package:kalan/utils/theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        title: Text('Track Order', style: AppTypography.display(context, fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildMapPlaceholder(context),
            const SizedBox(height: 32),
            _buildEstimatedTime(context),
            const SizedBox(height: 32),
            _buildStepper(context),
            const SizedBox(height: 32),
            _buildDeliveryPerson(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMapPlaceholder(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.light,
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage('https://source.unsplash.com/800x400/?city,map'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.color),
        ),
      ),
    );
  }

  Widget _buildEstimatedTime(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(LucideIcons.clock, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Text('Estimated Delivery: ', style: AppTypography.body(context, color: AppColors.textMuted)),
          Text('20 Min', style: AppTypography.body(context, fontWeight: FontWeight.w500, color: AppColors.primary)),
        ],
      ),
    );
  }

  Widget _buildStepper(BuildContext context) {
    final steps = ['Order Placed', 'Confirmed', 'Preparing', 'Out for Delivery', 'Delivered'];
    final activeStep = 3; // Out for delivery

    return Column(
      children: List.generate(steps.length, (index) {
        final isActive = index <= activeStep;
        final isLast = index == steps.length - 1;
        
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : AppColors.light,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 2),
                  ),
                  child: isActive ? const Icon(LucideIcons.check, color: AppColors.white, size: 12) : null,
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 40,
                    color: isActive ? AppColors.primary : AppColors.light,
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                steps[index],
                style: AppTypography.body(
                  context,
                  color: isActive ? AppColors.textPrimary : AppColors.textMuted,
                  fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildDeliveryPerson(BuildContext context) {
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
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage('https://source.unsplash.com/100x100/?portrait,person&sig=2'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Driver', style: AppTypography.display(context, fontSize: 16)),
                const SizedBox(height: 4),
                Text('Delivery Partner', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.bg,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.light),
            ),
            child: const Icon(LucideIcons.messageSquare, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(LucideIcons.phoneCall, color: AppColors.white, size: 20),
          ),
        ],
      ),
    );
  }
}
