class ServiceP {
  final String name;
  late final double rating;

  ServiceP({required this.name, required this.rating});
}

List<ServiceP> servProviders = [
  ServiceP(name: "Viva auto shop", rating: 4.5),
  ServiceP(name: "Car repairs 24/7", rating: 3.0),
  ServiceP(name: "West Coast Customs", rating: 3.0),
  ServiceP(name: "RailCoat Repairs", rating: 0.0),
  ServiceP(name: "Jhonson's", rating: 3.0),
  // Add more customer data as needed.
];