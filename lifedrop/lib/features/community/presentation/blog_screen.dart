import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  bool stayInformed = false;

  // Helper to build the colorful fact cards
  Widget _buildFactCard(Color color, double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Community',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 20),
              const Text(
                'Facts about Thalassemia',
                style: TextStyle(fontSize: 18, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 24),

              // Colorful Grid Area
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _buildFactCard(const Color(0xFF4DB8FF), 100, 140), // Light Blue
                      const SizedBox(height: 12),
                      _buildFactCard(const Color(0xFFFF9F43), 60, 140), // Orange
                    ],
                  ),
                  const SizedBox(width: 12),
                  _buildFactCard(const Color(0xFFFFD93D), 172, 140), // Yellow (Tall)
                ],
              ),
              const SizedBox(height: 32),

              // Learn More Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.surface, // Dark gray background
                  foregroundColor: AppColors.primary, // Red text
                  side: const BorderSide(color: AppColors.primary), // Red border
                ),
                onPressed: () {
                  // TODO: Open blog articles
                },
                child: const Text('Learn More'),
              ),
              const SizedBox(height: 40),

              // Stay Informed Toggle
              const Text(
                'Stay Informed',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 12),
              Switch(
                value: stayInformed,
                activeColor: Colors.white,
                activeTrackColor: AppColors.primary,
                inactiveThumbColor: AppColors.textSecondary,
                inactiveTrackColor: AppColors.surface,
                onChanged: (value) {
                  setState(() => stayInformed = value);
                },
              ),
              
              const SizedBox(height: 40),
              const Text(
                'to help you 😊',
                style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 16),

              // Join Group Button (Green from UI)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2ECC71), // Vibrant Green
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // TODO: Navigate to group chat or WhatsApp link
                },
                child: const Text('Join Group'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}