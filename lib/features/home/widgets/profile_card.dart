import 'dart:io'; // أضفنا استيراد ملفات الـ File
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final String userName;
  final File? imageFile; // متغير لاستقبال الصورة

  const ProfileCard({
    Key? key, 
    this.userName = 'Ahmed',
    this.imageFile, // جعله اختيارياً
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // دائرة الصورة الشخصية
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.2),
            shape: BoxShape.circle,
            // إذا كانت الصورة موجودة يتم عرضها، وإلا تختفي وتظهر الأيقونة خلفها
            image: imageFile != null
                ? DecorationImage(
                    image: FileImage(imageFile!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: imageFile == null
              ? const Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                  size: 28,
                )
              : null,
        ),
        const SizedBox(width: 12),
        
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