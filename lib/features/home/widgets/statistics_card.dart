import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class StatisticsCard extends StatelessWidget {
  final String totalTasks;
  final String doneTasks;
  final String pendingTasks;

  const StatisticsCard({
    Key? key,
    this.totalTasks = '12',
    this.doneTasks = '5',
    this.pendingTasks = '7',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Tasks', totalTasks),
          _buildDivider(),
          _buildStatItem('Done', doneTasks),
          _buildDivider(),
          _buildStatItem('Pending', pendingTasks),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: AppColors.white.withOpacity(0.3),
    );
  }
}