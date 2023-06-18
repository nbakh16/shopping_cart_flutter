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
        title: const Text('Cart Details'),
      ),
      body: Center(
        child: Text(totalProduct.toString()),
      ),
    );
  }
}
