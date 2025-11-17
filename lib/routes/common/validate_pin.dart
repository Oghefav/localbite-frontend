import 'package:flutter/material.dart';

class ValidatePinPage extends StatelessWidget {
  const ValidatePinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              
              // Header
              _buildModernHeader(),
              const SizedBox(height: 60),
              
              // PIN Input
              _buildModernPinInput(),
              const SizedBox(height: 40),
              
              // Keypad
              _buildModernKeypad(),
              const Spacer(),
              
              // Footer
              _buildModernFooter(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernHeader() {
    return Column(
      children: [
        // Animated Icon
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue.shade400, Colors.blue.shade700],
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.lock_outline_rounded,
            size: 32,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        
        // Title
        const Text(
          'Security PIN',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        
        // Subtitle
        Text(
          'Enter your PIN to verify your identity',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildModernPinInput() {
    return Column(
      children: [
        // PIN Circles with animation
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            final isFilled = index < 2;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 16,
              height: 16,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isFilled ? Colors.blue : Colors.grey[300],
                border: isFilled ? null : Border.all(color: Colors.grey[400]!),
              ),
            );
          }),
        ),
        const SizedBox(height: 24),
        
        // Shake animation for error (optional)
        // _buildErrorText(),
      ],
    );
  }

  Widget _buildModernKeypad() {
    return SizedBox(
      width: 280,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          if (index == 9) {
            return _buildBiometricButton();
          } else if (index == 10) {
            return _buildKeypadButton('0');
          } else if (index == 11) {
            return _buildKeypadButton(
              '',
              icon: Icons.backspace_outlined,
            );
          } else {
            return _buildKeypadButton('${index + 1}');
          }
        },
      ),
    );
  }

  Widget _buildKeypadButton(String text, {IconData? icon}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _onKeyPressed(text),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: icon != null
                ? Icon(
                    icon,
                    color: Colors.grey[700],
                    size: 24,
                  )
                : Text(
                    text,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildBiometricButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handleBiometricAuth,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.green[100]!),
          ),
          child: const Center(
            child: Icon(
              Icons.fingerprint_rounded,
              color: Colors.green,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernFooter() {
    return Column(
      children: [
        TextButton(
          onPressed: _handleForgotPin,
          child: const Text(
            'Forgot your PIN?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  void _onKeyPressed(String value) {
    // Handle PIN input logic
    print('Key pressed: $value');
  }

  void _handleForgotPin() {
    // Handle forgot PIN
    print('Forgot PIN');
  }

  void _handleBiometricAuth() {
    // Handle biometric authentication
    print('Biometric auth');
  }
}