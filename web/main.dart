import 'dart:html';
import 'dart:convert';

class Product {
  int itemNumber;
  String description;
  double price;
  int quantity;
  double total;

  Product({
    required this.itemNumber,
    required this.description,
    required this.price,
    required this.quantity,
  }) {
    this.total = calculateTotal();
  }

  double calculateTotal() {
    return price * quantity;
  }

  double applyDiscount() {
    // Apply discount for specific product numbers
    if ([6, 11, 2, 13].contains(itemNumber)) {
      return total * 0.1; // 10% discount
    }
    return 0.0;
  }

  Map<String, dynamic> toMap() {
    return {
      'itemNumber': itemNumber,
      'description': description,
      'price': price,
      'quantity': quantity,
      'total': total,
    };
  }
}

void main() {
  // Retrieve product data from local storage
  var storedData = window.localStorage['products_data'];
  List<Map<String, dynamic>> productsData = [];

  if (storedData != null) {
    productsData = List<Map<String, dynamic>>.from(json.decode(storedData));
  } else {
    // Create 15 sample products if no data is stored
    for (int i = 1; i <= 15; i++) {
      productsData.add({
        'itemNumber': i,
        'description': 'Product $i',
        'price': 10.99 + i.toDouble(),
        'quantity': 2 + i,
      });
    }

    // Save product data to local storage
    window.localStorage['products_data'] = json.encode(productsData);
  }

  // Display information about each product
  for (var productData in productsData) {
    Product product = Product(
      itemNumber: productData['itemNumber'],
      description: productData['description'],
      price: productData['price'],
      quantity: productData['quantity'],
    );

    // product.displayInfo();
  }
}
