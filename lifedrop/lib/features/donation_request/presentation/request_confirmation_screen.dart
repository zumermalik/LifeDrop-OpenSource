import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../community/presentation/blog_screen.dart';

class RequestConfirmationScreen extends StatefulWidget {
  const RequestConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<RequestConfirmationScreen> createState() => _RequestConfirmationScreenState();
}

class _RequestConfirmationScreenState extends State<RequestConfirmationScreen> {
  // State for the notification toggle switch
  bool notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Header
              const Text(
                'Request Sent',
                style: TextStyle(fontSize: 22, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              const Text(
                'Your request is live 🔥',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 40),

              // Track Request Button
              Padding(
             padding: const EdgeInsets.symmetric(horizontal: 40.0),
             child: ElevatedButton(
               onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => const CommunityScreen()),
                 );
               },
               child: const Text('Track Request'),
             ),
           ),
              const SizedBox(height: 50),

              // Notification Prompt
              const Text(
                'Please Enable\nnotification',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 16),
              
              // Custom styled toggle switch
              Switch(
                value: notificationsEnabled,
                activeColor: Colors.white,
                activeTrackColor: AppColors.primary,
                inactiveThumbColor: AppColors.textSecondary,
                inactiveTrackColor: AppColors.surface,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                  // TODO: Trigger Firebase Cloud Messaging permission request
                },
              ),
              
              const Spacer(),

              // Footer Area
              const Text(
                'we are always here\nto help you 😊',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 30),

              // Call Donor Button (Styled white as per UI, waiting for match)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  // TODO: Implement calling feature once matched
                },
                child: const Text('Call Donor'),
              ),
              const SizedBox(height: 12),
              const Text(
                "We'll notify you when a donor accepts",
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}