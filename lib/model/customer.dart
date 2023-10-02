class Customer {
  final int id;
  final String name;
  late final int rating;
  final bool isCustomer;

  Customer({required this.id, required this.isCustomer ,required this.name, required this.rating});
}
//
// List<Customer> customers = [
//   Customer(name: "AT&T", rating: 4),
//   Customer(name: "Samnsung Co.", rating: 3),
//   Customer(name: "Apple Inc", rating: 3),
//   Customer(name: "Toon Network", rating: 0),
//   Customer(name: "Flower's Amarillis", rating: 3),
//   // Add more customer data as needed.
// ];