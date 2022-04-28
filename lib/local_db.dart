import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'employee_model.dart';

class LocalDatabase  {
  var database;

  void createDb() async{

    database = openDatabase(

        join(await getDatabasesPath(), 'employee_database.db'),

        onCreate: (db, version) {

    return db.execute(
    'CREATE TABLE employee(id INTEGER PRIMARY KEY, name TEXT)',

    );
    },


    version: 1,
    );
    print(database);
  }




  Future<void> insertEmployee(Employee emp) async {



    await database.insert(emp);


  }






}
