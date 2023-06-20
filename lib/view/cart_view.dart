import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView(
    this.addedProducts,
    {super.key}
  );

  final List<Map> addedProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: addedProducts.isEmpty
      ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.remove_shopping_cart,
              size: 100, color: Colors.black26,
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('Cart is Empty!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black
                ),
              ),
            )
          ],
        ),
      )
      : Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(18, 8, 18, 80),
            itemCount: addedProducts.length,
            itemBuilder: (context, index) {

              String name = addedProducts[index].values.elementAt(0);
              double price = addedProducts[index].values.elementAt(1);
              int count = addedProducts[index].values.elementAt(2);

              List<double> allPrices = [];
              double totalAmount = 0.0;
              allPrices.add(price*count);
              for(int i=0; i<allPrices.length; i++) {
                totalAmount += allPrices[i];
              }

              return ListTile(
                title: Text('$name ($count)'),
                trailing: Text('\$ ${price*count}'),
              );
            }
          ),
        ],
      ),
      floatingActionButton: addedProducts.isEmpty ? Container() : FloatingActionButton.extended(
        onPressed: (){

        },
        label: Text('Checkout'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
