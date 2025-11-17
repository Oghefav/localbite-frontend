import 'package:flutter/material.dart';
import 'package:locabite/core/utility/big_text.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: 'Transactions'),
        centerTitle: true,
       ),
      
    );
  }
}