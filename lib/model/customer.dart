class Customer {
  final String name;
  late final double rating;

  Customer({required this.name, required this.rating});
}

List<Customer> customers = [
  Customer(name: "AT&T", rating: 4.5),
  Customer(name: "Samnsung Co.", rating: 3.0),
  Customer(name: "Apple Inc", rating: 3.0),
  Customer(name: "Toon Network", rating: 0.0),
  Customer(name: "Flower's Amarillis", rating: 3.0),
  // Add more customer data as needed.
];