import 'dart:io'; 
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/profile_card.dart';
import '../widgets/statistics_card.dart';
import '../widgets/task_card.dart';
import '../widgets/add_task_dialog.dart';

class HomeScreen extends StatefulWidget {
  final String userName; 
  final File? imageFile; 

  const HomeScreen({
    Key? key, 
    required this.userName,
    this.imageFile, 
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // قائمة المهام التي تحتوي على المهام الافتراضية ويمكن إضافة مهام جديدة إليها
  final List<Map<String, dynamic>> tasksList = [
    {
      'title': 'Flutter UI Design',
      'subtitle': 'Complete the home screen layout',
      'status': 'Pending',
      'statusColor': Colors.orange,
      'indicatorColor': Colors.orange,
    },
    {
      'title': 'API Integration',
      'subtitle': 'Connect login and profile endpoints',
      'status': 'Done',
      'statusColor': Colors.green,
      'indicatorColor': Colors.green,
    },
    {
      'title': 'Code Review',
      'subtitle': 'Review clean architecture structure',
      'status': 'Pending',
      'statusColor': Colors.orange,
      'indicatorColor': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // ProfileCard
              ProfileCard(
                userName: widget.userName,
                imageFile: widget.imageFile, 
              ),
              const SizedBox(height: 24),
              
              const StatisticsCard(),
              const SizedBox(height: 24),
              
              const Text(
                'Today Tasks',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 16),
              
              Expanded(
                child: ListView.builder(
                  itemCount: tasksList.length,
                  itemBuilder: (context, index) {
                    final task = tasksList[index];
                    return TaskCard(
                      title: task['title'] ?? '',
                      subtitle: task['subtitle'] ?? '',
                      status: task['status'] ?? 'Pending',
                      statusColor: task['statusColor'] ?? Colors.orange,
                      indicatorColor: task['indicatorColor'] ?? Colors.orange,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: AppColors.white),
        onPressed: () async {
          // استقبال المهمة المضافة عند الضغط على زر Next في صفحة إضافة المهمة
          final newTask = await showModalBottomSheet<Map<String, dynamic>>(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const AddTaskScreen(),
          );

          if (newTask != null && newTask['title'] != null && newTask['title'].isNotEmpty) {
            setState(() {
              // تحديد لون الحالة بناءً على اختيار المستخدم
              Color statusColor = Colors.orange;
              if (newTask['status'] == 'Completed') {
                statusColor = Colors.green;
              } else if (newTask['status'] == 'In Progress') {
                statusColor = Colors.blue;
              }

              // إضافة المهمة الجديدة إلى قائمة المهام لكي تظهر فوراً
              tasksList.insert(0, {
                'title': newTask['title'],
                'subtitle': newTask['description'].isEmpty ? 'No description' : newTask['description'],
                'status': newTask['status'],
                'statusColor': statusColor,
                'indicatorColor': statusColor,
              });
            });
          }
        },
      ),
    );
  }
}