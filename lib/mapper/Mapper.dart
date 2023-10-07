import 'package:test_app/model/customer.dart';
import 'package:test_app/model/service_provider.dart';

class Mapper{

   List<Customer> convertToCustomerList(List<Map<String, dynamic>> mapList) {
      List<Customer> customerList = [];

      for (Map<String, dynamic> map in mapList) {
         int id = map['id'];
         String name = map['name'];
         int rating = map['rating_value'];
         int isCustomer = map['is_Customer']==null ? 1 : 1;

         Customer customer = Customer(id:id, name: name, rating: rating,isCustomer:isCustomer );
         customerList.add(customer);
      }
      return customerList;
   }
   List<ServiceP> convertToServicePList(List<Map<String, dynamic>> mapList) {
      List<ServiceP> servicePList = [];

      for (Map<String, dynamic> map in mapList) {
         int id = map['id'];
         String name = map['name'];
         int rating = map['rating_value'];
         int isCustomer = map['is_Customer']==null ? 1 : 1;

         ServiceP serviceP = ServiceP(id:id, name: name, rating: rating,isCustomer:isCustomer );
         servicePList.add(serviceP);
      }
      return servicePList;
   }
   // Convert a Rating object to a Map for database operations
   Map<String, dynamic> toMap(Customer customer) {
      return {
         'id': customer.id,
         'name':customer.name,
         'rating': customer.rating,
         'is_customer': customer.isCustomer,
      };
   }

}

