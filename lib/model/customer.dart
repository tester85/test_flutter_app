class Customer {
  final String name;
  late final double rating;

  Customer({required this.name, required this.rating});
}

List<Customer> customers = [
  Customer(name: "Viva auto shop", rating: 4.5),
  Customer(name: "Car repairs 24/7", rating: 3.0),
  Customer(name: "West Coast Customs", rating: 3.0),
  Customer(name: "RailCoat Repairs", rating: 0.0),
  Customer(name: "Jhonson's", rating: 3.0),
  Customer(name: "Dog Care", rating: 5.0),
  // Add more customer data as needed.
];