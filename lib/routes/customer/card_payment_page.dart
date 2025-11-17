import 'package:flutter/material.dart';
import 'package:locabite/routes/customer/payment_succes_page.dart';

class CardPaymentPage extends StatefulWidget {
  const CardPaymentPage({super.key});

  @override
  State<CardPaymentPage> createState() => _CardPaymentPageState();
}

class _CardPaymentPageState extends State<CardPaymentPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Payment'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card Preview
              _buildCardPreview(),
              const SizedBox(height: 24),
              
              // Card Number
              _buildCardNumberField(),
              const SizedBox(height: 16),
              
              // Card Holder
              _buildCardHolderField(),
              const SizedBox(height: 16),
              
              // Expiry Date & CVV
              Row(
                children: [
                  Expanded(
                    child: _buildExpiryDateField(),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCVVField(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // Total Amount
              _buildTotalAmount(),
              const SizedBox(height: 24),
              
              // Pay Button
              _buildPayButton(),
              const SizedBox(height: 16),
              
              // Security Notice
              _buildSecurityNotice(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardPreview() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue[800]!, Colors.blue[600]!],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Chip
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: 40,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.amber[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          
          // Card Number
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Text(
              _cardNumberController.text.isEmpty 
                  ? '•••• •••• •••• ••••'
                  : _formatCardNumber(_cardNumberController.text),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 2,
              ),
            ),
          ),
          
          // Card Holder
          Positioned(
            bottom: 40,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CARD HOLDER',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 10,
                  ),
                ),
                Text(
                  _cardHolderController.text.isEmpty 
                      ? 'YOUR NAME'
                      : _cardHolderController.text.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Expiry Date
          Positioned(
            bottom: 40,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'EXPIRES',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 10,
                  ),
                ),
                Text(
                  _expiryDateController.text.isEmpty 
                      ? 'MM/YY'
                      : _expiryDateController.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardNumberField() {
    return TextFormField(
      controller: _cardNumberController,
      decoration: const InputDecoration(
        labelText: 'Card Number',
        prefixIcon: Icon(Icons.credit_card),
        border: OutlineInputBorder(),
        hintText: '1234 5678 9012 3456',
      ),
      keyboardType: TextInputType.number,
      maxLength: 19,
      onChanged: (value) {
        setState(() {});
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter card number';
        }
        if (value.replaceAll(' ', '').length != 16) {
          return 'Please enter valid card number';
        }
        return null;
      },
    );
  }

  Widget _buildCardHolderField() {
    return TextFormField(
      controller: _cardHolderController,
      decoration: const InputDecoration(
        labelText: 'Card Holder Name',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
        hintText: 'John Doe',
      ),
      onChanged: (value) {
        setState(() {});
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter card holder name';
        }
        return null;
      },
    );
  }

  Widget _buildExpiryDateField() {
    return TextFormField(
      controller: _expiryDateController,
      decoration: const InputDecoration(
        labelText: 'Expiry Date',
        prefixIcon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(),
        hintText: 'MM/YY',
      ),
      keyboardType: TextInputType.datetime,
      maxLength: 5,
      onChanged: (value) {
        setState(() {});
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter expiry date';
        }
        if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
          return 'Please enter valid expiry date (MM/YY)';
        }
        return null;
      },
    );
  }

  Widget _buildCVVField() {
    return TextFormField(
      controller: _cvvController,
      decoration: const InputDecoration(
        labelText: 'CVV',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        hintText: '123',
      ),
      keyboardType: TextInputType.number,
      maxLength: 3,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter CVV';
        }
        if (value.length != 3) {
          return 'Please enter valid CVV';
        }
        return null;
      },
    );
  }

  Widget _buildTotalAmount() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Amount',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            '₦5,250.00',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildPayButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isProcessing ? null : _processPayment,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: _isProcessing
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
              )
            : const Text(
                'Pay ₦5,250.00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  Widget _buildSecurityNotice() {
    return const Row(
      children: [
        Icon(Icons.security, color: Colors.green, size: 16),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Your payment is secure and encrypted. We never store your card details.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  String _formatCardNumber(String input) {
    final cleaned = input.replaceAll(' ', '');
    final chunks = <String>[];
    for (int i = 0; i < cleaned.length; i += 4) {
      chunks.add(cleaned.substring(i, i + 4 > cleaned.length ? cleaned.length : i + 4));
    }
    return chunks.join(' ');
  }

  void _processPayment() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isProcessing = true;
      });

      // Simulate payment processing
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isProcessing = false;
      });

      // Navigate to success page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PaymentSuccessPage()),
      );
    }
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}