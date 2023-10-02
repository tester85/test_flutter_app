import 'package:test_app/model/customer.dart';

class CustomerMapper{

   List<Customer> convertToCustomerList(List<Map<String, dynamic>> mapList) {
      List<Customer> customerList = [];

      for (Map<String, dynamic> map in mapList) {
         int id = map['id'];
         String name = map['name'];
         int rating = map['rating'];
         bool isCustomer = map['isCustomer'];

         Customer customer = Customer(id:id, name: name, rating: rating,isCustomer:isCustomer );
         customerList.add(customer);
      }
      return customerList;
   }
   // Convert a Rating object to a Map for database operations
   Map<String, dynamic> toMap(Customer customer) {
      return {
         'id': customer.id,
         'name':customer.name,
         'rating': customer.rating,
         'is_customer': customer.isCustomer ? 1 : 0, // Store as 1 or 0
      };
   }

}

