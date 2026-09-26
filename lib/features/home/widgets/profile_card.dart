import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final String userName;

  const ProfileCard({Key? key, this.userName = 'Ahmed'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // صورة البروفيسل الدائرية
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person,
            color: AppColors.primaryColor,
            size: 28,
          ),
        ),
        const SizedBox(width: 12),
        // التحية واسم المستخدم
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning 👋',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textGray,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              userName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ],
        ),
        const Spacer(),
        // أيقونة الإشعارات
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: const Icon(
            Icons.notifications_outlined,
            color: AppColors.textDark,
            size: 22,
          ),
        ),
      ],
    );
  }
}