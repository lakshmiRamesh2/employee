import 'package:employe/ApiManager.dart';
import 'package:employe/employeeDetail.dart';
import 'package:employe/local_db.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List emp=[];
  List searchedList=[];
  TextEditingController controller=TextEditingController();

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
   emp=await ApiManager().getEmployeeDetails();
    // emp=await LocalDatabase().employeeList();

    print(emp.length);

    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
      ),
      body:(emp.length==0)?Center(
        child: CircularProgressIndicator(),
      ):ListView(
        children: [

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: new TextField(
                   controller: controller,

                  onChanged: (value) {


                     if(value.isEmpty){
                       setState(() {
                         searchedList=[];
                       });


                     }

                   setState(() {
                     searchedList=[];

                     emp.forEach((element) {
                       print(value[1]);
                       print(element["name"][1]);
                       if(value[1]==element["name"][1]||value[2]==element["name"][2]){

                         searchedList.add(element);
                       }
                       setState(() {

                       });
                     });
                   });

                  },
                  decoration: new InputDecoration(
                    suffix: InkWell(
                      onTap: () {

                      },
                      child: Icon(
                        Icons.search,
                        size: 20,
                      ),
                    ),
                    labelText: "Search",
                    hintStyle:
                    TextStyle(fontSize: 16.0, color: Colors.blue),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
          ),

          (searchedList.length==0)?ListView.builder(
            itemCount: emp.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
           // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {

              print("im in the home screen");
              print(index);
              print(emp[1]);

              // print(emp[1]["id"]);
              // print(emp[index+1]["profileImage"]);
              // print(emp[index+1]["company"]["name"]);

              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  EmployeeDetails(emp:emp[index])),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: CircleAvatar(
                                 radius: 50,
                                child:
                                Image.network(emp[index]["profile_image"].toString(),),
                            ),
                             ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (emp[index]["name"]==null)?Text(""):Text(emp[index]["name"]),
                                (emp[index]["company"]==null)?Text(""):Text(emp[index]["company"]["name"])

                              ],
                            )
                          ],)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ):ListView.builder(
            itemCount: searchedList.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {

              print("im in the home screen");
              print(index);
              print(emp[1]);

              // print(emp[1]["id"]);
              // print(emp[index+1]["profileImage"]);
              // print(emp[index+1]["company"]["name"]);

              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  EmployeeDetails(emp:searchedList[index])),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 50,
                                  child:
                                  Image.network(searchedList[index]["profile_image"].toString(),),
                                ),
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (searchedList[index]["name"]==null)?Text(""):Text(searchedList[index]["name"]),
                                  (searchedList[index]["company"]==null)?Text(""):Text(searchedList[index]["company"]["name"])

                                ],
                              )
                            ],)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
