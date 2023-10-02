import 'package:test_app/database/sql_helper.dart';

class CustomerDao {

  Future<List<Map<String, dynamic>>> findAllCustomer(bool customer) async {
    final List<Map<String, dynamic>> data = await SQLHelper.getItems(true);

    return data;
    }

  Future<List<Map<String, dynamic>>> getCustomerList() async {
      List<Map<String, dynamic>> dataList = [];
      final futureData = await findAllCustomer(true);
      if (futureData != null) {
        dataList = List.from(futureData);
      }
    return dataList;
    }


}

