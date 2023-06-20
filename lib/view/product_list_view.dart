import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/view/cart_view.dart';

import '../model/product_model.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {

  List<Product> products = [];

  void initializeDummyProducts() {
    for (int i=1; i<=25; i++) {
      products.add(Product(name: 'Product $i', price: i*10));
    }
  }

  @override
  void initState() {
    initializeDummyProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.more_vert)
          )
        ],
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: products.length,
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
                title: Text(products[index].name.toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),
                subtitle: Text('\$ ${products[index].price}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        SnackBar snackBar = const SnackBar(
                          content: Text('Cannot remove anymore!'),
                          backgroundColor: Colors.redAccent,
                        );
                        setState(() {
                          products[index].inCartCount > 0
                              ? products[index].inCartCount--
                              : ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder()
                      ),
                      child: const Icon(Icons.remove),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Text(products[index].inCartCount.toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          SnackBar snackBar = const SnackBar(
                            content: Text('Maximum amount reached!'),
                            backgroundColor: Colors.lightGreen,
                          );

                          products[index].inCartCount < 10
                              ? products[index].inCartCount++
                              : ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder()
                      ),
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          List<Map<String, dynamic>> productsAdded = [];

          for (var i=0; i<products.length; i++){
            if(products[i].inCartCount > 0) {
              productsAdded.add(
                {
                  'name' : products[i].name,
                  'price' : products[i].price,
                  'inCart' : products[i].inCartCount
                },
              );
            }
          }
          // print(productsAdded);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartView(productsAdded)),
          );
        },
        elevation: 5,
          backgroundColor: const Color(0xFF03254C),
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
