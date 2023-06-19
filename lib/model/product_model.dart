class Product{
  String name;
  double price;
  int inCartCount;

  Product({
    required this.name,
    required this.price,
    this.inCartCount = 0
  });
}