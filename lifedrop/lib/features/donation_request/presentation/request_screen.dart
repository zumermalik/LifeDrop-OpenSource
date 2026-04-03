import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'request_confirmation_screen.dart';


class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  String selectedType = ''; 
  String selectedRh = ''; 
  String selectedUrgency = ''; // 'Normal' or 'Urgent'

  final TextEditingController contactController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();

  @override
  void dispose() {
    contactController.dispose();
    hospitalController.dispose();
    super.dispose();
  }

  // Helper for Blood Type boxes (same as Donor screen)
  Widget _buildSelectionBox(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: text.length > 2 ? 60 : 50,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  // Helper specifically for the wider Urgency buttons
  Widget _buildUrgencyBox(String text, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  // Helper for text inputs
  Widget _buildTextField(String hint, TextEditingController controller, {IconData? icon, TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.textSecondary),
          prefixIcon: icon != null ? Icon(icon, color: AppColors.textSecondary) : null,
          filled: true,
          fillColor: AppColors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
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
            crossAxisAlignment: CrossAxisAlignment.center, // Centered like the UI image
            children: [
              const Text(
                'Patient Request Form',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 32),

              const Text('Blood Type needed:', style: TextStyle(fontSize: 16, color: AppColors.textPrimary)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['A', 'B', 'AB', 'O'].map((type) {
                  return _buildSelectionBox(type, selectedType == type, () => setState(() => selectedType = type));
                }).toList(),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSelectionBox('+', selectedRh == '+', () => setState(() => selectedRh = '+')),
                  const SizedBox(width: 20),
                  _buildSelectionBox('-', selectedRh == '-', () => setState(() => selectedRh = '-')),
                ],
              ),
              const SizedBox(height: 32),

              const Text('Urgency', style: TextStyle(fontSize: 16, color: AppColors.textPrimary)),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildUrgencyBox('Normal: 1 day', selectedUrgency == 'Normal', () => setState(() => selectedUrgency = 'Normal')),
                  _buildUrgencyBox('Urgent: 1 hour', selectedUrgency == 'Urgent', () => setState(() => selectedUrgency = 'Urgent')),
                ],
              ),
              const SizedBox(height: 32),

              const Text('Contact info', style: TextStyle(fontSize: 16, color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              _buildTextField('03XX-XXXXXXX', contactController, keyboardType: TextInputType.phone),
              
              const SizedBox(height: 16),
              const Text('Hospital', style: TextStyle(fontSize: 16, color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              _buildTextField('Shaukat Khanum Memorial...', hospitalController),
              
              const SizedBox(height: 32),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  // Push to the confirmation screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RequestConfirmationScreen()),
                  );
                },
                child: const Text('Submit Request'),
              ),
              const SizedBox(height: 20),
              
              const Text(
                'Need Blood?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
              const Text(
                "We'll alert compatible donors near you.",
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}