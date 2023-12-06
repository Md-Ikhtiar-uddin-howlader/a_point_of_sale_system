import 'dart:convert';
import 'dart:html';

// DIMYATI AGUNG NABHAN
class Product {
  final String itemNumber;
  final String description;
  final double price;
  final int quantity;

  Product({
    required this.itemNumber,
    required this.description,
    required this.price,
    required this.quantity,
  });

  // Convert Product to a Map
  Map<String, dynamic> toMap() {
    return {
      'itemNumber': itemNumber,
      'description': description,
      'price': price,
      'quantity': quantity,
    };
  }

  // Create a Product from a Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      itemNumber: map['itemNumber'],
      description: map['description'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }
}

void main() {
  // AFFIF
  var products = <Product>[
    Product(
      itemNumber: '1',
      description: 'Iphone 15',
      price: 4499.00,
      quantity: 1,
    ),
  Product(
        itemNumber: '2',
        description: 'Macbook',
        price: 5999.00,
        quantity: 1
      ),
      Product(
        itemNumber: '3',
        description: 'Chrome book',
        price: 2999.00,
        quantity: 1
      ),
      Product(
        itemNumber: '4',
        description: 'Chrome book',
        price: 2999.00,
        quantity: 1
      ),
      Product(
        itemNumber: '5',
        description: 'laptop bag',
        price: 99.00,
        quantity: 1
      ),
      Product(
        itemNumber: '6',
        description: 'Blazers',
        price: 299.00,
        quantity: 1
      ),
      Product(
        itemNumber: '7',
        description: 'Fake Eyelashes',
        price: 29.00,
        quantity: 1
      ),
      Product(
        itemNumber: '8',
        description: 'Car Phone Holders',
        price: 30.00,
        quantity: 1
      ),
      Product(
        itemNumber: '9',
        description: 'Phone Cases',
        price: 10.00,
        quantity: 1
      ),
      Product(
        itemNumber: '10',
        description: 'Headphones',
        price: 159.00,
        quantity: 1
      )
 
  ];

  // Store products in local storage
  window.localStorage['products_data'] = jsonEncode(products.map((p) => p.toMap()).toList());

  // Retrieve products from local storage
  var storedData = window.localStorage['products_data'];
  if (storedData != null) {
    var storedProducts = (jsonDecode(storedData) as List<dynamic>).map((e) => Product.fromMap(e)).toList();

    // Now, storedProducts contains the list of Product objects retrieved from local storage
    print(storedProducts);
  }

}
