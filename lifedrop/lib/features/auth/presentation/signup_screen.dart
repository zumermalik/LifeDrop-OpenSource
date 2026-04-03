import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // State variables to hold the selected blood type
  String selectedType = ''; // A, B, AB, O
  String selectedRh = ''; // +, -

  // Controllers for the text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    contactController.dispose();
    emailController.dispose();
    super.dispose();
  }

  // Helper widget to build the blood type selection boxes
  Widget _buildSelectionBox(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: text.length > 2 ? 60 : 50, // Make 'AB' box slightly wider
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

  // Helper widget to build the text input fields
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
          fillColor: AppColors.surface, // Uses the lighter dark-mode surface color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none, // Removes the default border
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Become a Lifesaver',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 8),
              const Text(
                "We'll notify you when someone nearby needs your help.",
                style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 32),

              // Blood Type Selector Area
              const Text(
                'Your Blood Type:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 12),
              
              // A, B, AB, O Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['A', 'B', 'AB', 'O'].map((type) {
                  return _buildSelectionBox(type, selectedType == type, () {
                    setState(() => selectedType = type);
                  });
                }).toList(),
              ),
              const SizedBox(height: 16),
              
              // +, - Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSelectionBox('+', selectedRh == '+', () {
                    setState(() => selectedRh = '+');
                  }),
                  const SizedBox(width: 20),
                  _buildSelectionBox('-', selectedRh == '-', () {
                    setState(() => selectedRh = '-');
                  }),
                ],
              ),
              const SizedBox(height: 32),

              // Input Fields
              _buildTextField('Full Name', nameController, icon: Icons.person),
              _buildTextField('Location (City or Zip Code)', locationController, icon: Icons.location_on),
              _buildTextField('Contact Number', contactController, icon: Icons.phone, keyboardType: TextInputType.phone),
              _buildTextField('Email Address', emailController, icon: Icons.email, keyboardType: TextInputType.emailAddress),
              
              const SizedBox(height: 32),

              // Register Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Wire this up to Firebase Auth & Firestore later
                  print("Registering: $selectedType$selectedRh");
                },
                child: const Text('Register'),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}