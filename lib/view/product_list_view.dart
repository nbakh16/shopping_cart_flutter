import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/view/cart_view.dart';

import '../model/product_model.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {

  List<Product> product = [];

  void initializeProduct() {
    for (int i = 1; i <= 40; i++) {
      product.add(Product(name: 'Product $i', price: i * 10));
    }
  }

  @override
  void initState() {
    initializeProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: product.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                width: 1.25,
                color: Colors.blue
              )
            ),
            elevation: 2,
            child: ListTile(
              title: Text(product[index].name.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              ),
              subtitle: Text('\$ ${product[index].price}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black
                ),
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(product[index].inCartCount.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          product[index].inCartCount++;

                          if(product[index].inCartCount == 5) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Congratulations!'),
                                  content: Text('You\'ve bought 5 ${product[index].name}!'),
                                  actions: [
                                    TextButton(
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          int totalProductInCart = 0;
          for (var i=0; i<product.length; i++){
            totalProductInCart += product[i].inCartCount;
          }

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartView(totalProductInCart)),
          );
        },
        elevation: 5,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
