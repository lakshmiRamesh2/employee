import 'dart:convert';

import 'package:employe/employee_model.dart';
import 'employee_model.dart';
import "package:http/http.dart" as http;
import 'local_db.dart';

class ApiManager{


  Future<List> getEmployeeDetails() async{
     List<Employee> emps=[];

    var response;

    var url = "http://www.mocky.io/v2/5d565297300000680030a986";
    var headers = {
      "content-type": "application/json",
      "accept": "application/json",
    };
   try {
      response = await http.Client().get((Uri.parse(url)), headers: headers);
      print(response.statusCode);
      print(response.body);

        if (response.statusCode == 200) {

       List emp=await jsonDecode(response.body);
//       emp.forEach((element) async{
//         Address add=Address(
//           city: element["address"]["city"],
//           street: element["address"]["street"],
//           suite: element["address"]["suite"],
//           zipcode: element["address"]["zipcode"],
//         );
//
//         Company company=Company(
//           name: element["company"]["name"]??"null",
//           bs:element["company"]["bs"],
//           catchPhrase:element["company"]["catchPhrase"],
//         );
//
//        Employee empj= Employee(
//          email: element["email"],
//           name: element["name"],
//           address: add,
//           company: company,
//           id: element["id"],
//           phone: element["phone"],
//           profileImage: element["profile_image"],
//           userName: element["userName"],
//           webSite: element["website"],
//        );
//
// print(emp);
// print("lak");
//       // await LocalDatabase().insertEmployee(emp);
//
// emps.add(empj);
//
//       });
      return emp;







      }

    } on Exception catch (e) {
      print("its not 2001");
      print(e);

    }
  }


}