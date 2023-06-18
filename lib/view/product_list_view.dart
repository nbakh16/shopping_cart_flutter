import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/view/cart_view.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {

  int counter = 0;

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
        itemCount: 16,
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
              title: Text('Product ${index+1}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              ),
              subtitle: Text('\$ ${((index+1)*10).toStringAsFixed(2)}',
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
                        counter > 0
                                ? counter--
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
                    child: Text(counter.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        counter++;
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartView(counter,)),
          );
        },
        child: Icon(Icons.shopping_cart),
        elevation: 5,
      ),
    );
  }
}
