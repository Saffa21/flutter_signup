import 'dart:io'; 
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/profile_card.dart';
import '../widgets/statistics_card.dart';
import '../widgets/task_card.dart';
import '../widgets/add_task_dialog.dart';

class HomeScreen extends StatelessWidget {
  final String userName; 
  final File? imageFile; 

  const HomeScreen({
    Key? key, 
    required this.userName,
    this.imageFile, 
  }) : super(key: key);

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
                userName: userName,
                imageFile: imageFile, 
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
                child: ListView(
                  children: const [
                    TaskCard(
                      title: 'Flutter UI Design',
                      subtitle: 'Complete the home screen layout',
                      status: 'Pending',
                      statusColor: Colors.orange,
                      indicatorColor: Colors.orange,
                    ),
                    TaskCard(
                      title: 'API Integration',
                      subtitle: 'Connect login and profile endpoints',
                      status: 'Done',
                      statusColor: Colors.green,
                      indicatorColor: Colors.green,
                    ),
                    TaskCard(
                      title: 'Code Review',
                      subtitle: 'Review clean architecture structure',
                      status: 'Pending',
                      statusColor: Colors.orange,
                      indicatorColor: Colors.orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: AppColors.white),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const AddTaskScreen(),
          );
        },
      ),
    );
  }
}