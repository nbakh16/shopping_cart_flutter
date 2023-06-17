import 'package:flutter/material.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
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
                  fontWeight: FontWeight.w500
                ),
              ),
              subtitle: Text('\$ ${((index+1)*10).toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: (){

                    },
                    child: Icon(Icons.remove),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text('2',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){

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
      )
    );
  }
}
