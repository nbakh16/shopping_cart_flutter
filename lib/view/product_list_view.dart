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
              icon: Icon(Icons.more_vert)
          )
        ],
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
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
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),
                subtitle: Text('\$ ${products[index].price}',
                  style: TextStyle(
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
                      child: Icon(Icons.remove),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder()
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Text(products[index].inCartCount.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          products[index].inCartCount++;
                        });
                      },
                      child: Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder()
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
          for (var i=0; i<products.length; i++){
            totalProductInCart += products[i].inCartCount;
          }

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartView(totalProductInCart)),
          );
        },
        child: Icon(Icons.shopping_cart),
        elevation: 5,
      ),
    );
  }
}
