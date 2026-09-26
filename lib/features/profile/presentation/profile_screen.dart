import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/presentation/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    bool isArabic = _selectedLanguage == 'العربية';

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButton<String>(
                value: _selectedLanguage,
                underline: const SizedBox(),
                icon: const Icon(Icons.language, color: AppColors.textDark),
                items: ['English', 'العربية'].map((String lang) {
                  return DropdownMenuItem<String>(
                    value: lang,
                    child: Text(
                      lang,
                      style: const TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  isArabic ? 'إنشاء ملفك الشخصي' : 'Create Your Profile',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isArabic ? 'أضف اسمك وصورة الحساب' : 'Add your name and profile picture',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textGray,
                  ),
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(
                    isArabic ? 'الاسم الكامل' : 'Full Name',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _nameController,
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  decoration: InputDecoration(
                    hintText: isArabic ? 'أدخل اسمك الكامل' : 'Enter your full name',
                    hintStyle: const TextStyle(color: AppColors.textGray),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_nameController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(isArabic ? 'الرجاء إدخال الاسم أولاً!' : 'Please enter your name first!')),
                        );
                        return;
                      }
                      
                      // الانتقال وإرسال الاسم الذي كتبه المستخدم
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(userName: _nameController.text.trim()),
                        ),
                      );
                    },
                    child: Text(
                      isArabic ? 'متابعة' : 'Continue',
                      style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}