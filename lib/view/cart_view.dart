import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  CartView(
    this.addedProducts,
    {super.key}
  );

  final List<Map> addedProducts;
  final List<double> listOfAllPrices = [];

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
            itemCount: addedProducts.length + 1, //1 extra index for extra row of Total amount
            itemBuilder: (context, index) {
              if(index <= addedProducts.length-1) {
                String name = addedProducts[index].values.elementAt(0);
                double price = addedProducts[index].values.elementAt(1);
                int count = addedProducts[index].values.elementAt(2);

                listOfAllPrices.add(price*count);
                // print(listOfAllPrices);


                return ListTile(
                  title: Text('$name ($count)'),
                  trailing: Text('\$ ${price*count}'),
                );
              }

              else {
                return Text(
                  'Total: \$ ${listOfAllPrices.reduce((value, element) => value+element)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent
                  ),
                  textAlign: TextAlign.center,
                );
              }

            },
          ),
        ],
      ),
      floatingActionButton: addedProducts.isEmpty ? Container() : FloatingActionButton.extended(
        onPressed: (){
          //
        },
        label: const Text('Checkout'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
