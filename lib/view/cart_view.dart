import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView(
    this.totalProduct,
    {super.key}
  );

  final int totalProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Total Products: $totalProduct',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
