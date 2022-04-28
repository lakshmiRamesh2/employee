import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EmployeeDetails extends StatefulWidget {
  var emp;

  EmployeeDetails({this.emp});
  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("employee details");
    print(widget.emp);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee Details"),),


      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 50,
              child:
              Image.network(widget.emp["profile_image"].toString()),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(

                    children: [
                         Expanded( flex:2,child: Text("Name :",style:TextStyle(fontSize: 18),)),
                    Expanded( flex:2,child: Text(widget.emp["name"],style:TextStyle(fontSize: 18),)),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(

                    children: [
                  Expanded( flex:2,child: Text("Username :",style:TextStyle(fontSize: 18),)),
                      Expanded( flex:2,child: Text(widget.emp["username"],style:TextStyle(fontSize: 18),)),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(

                    children: [
                      Expanded( flex:2,child: Text("Email Address :",style:TextStyle(fontSize: 18),)),
                      Expanded( flex:2,child: Text(widget.emp["email"],style:TextStyle(fontSize: 18),)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(

                    children: [
                      Expanded( flex:2,child: Text("Address :",style:TextStyle(fontSize: 18),)),
                      Expanded( flex:2,
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                            child: Column(
                              children: [
                                Text(widget.emp["address"]["street"]+" "+widget.emp["address"]["suite"]+" "+widget.emp["address"]["city"]+" "+widget.emp["address"]["zipcode"],style:TextStyle(fontSize: 18),),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(

                    children: [
                      Expanded( flex:2,child: Text("Phone :",style:TextStyle(fontSize: 18),)),
                      (widget.emp["phone"]==null) ? Expanded( flex:2,child: Text("")): Expanded( flex:2,child: Text(widget.emp["phone"],style:TextStyle(fontSize: 18),)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(

                    children: [
                      Expanded( flex:2,child: Text("WebSite :",style:TextStyle(fontSize: 18),)),
                      (widget.emp["website"]==null)?Expanded( flex:2,child: Text("",style:TextStyle(fontSize: 18),)): Expanded( flex:2,child: Text(widget.emp["website"],style:TextStyle(fontSize: 18),)),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(

                    children: [
                      Expanded( flex:2,child: Text("Company :",style:TextStyle(fontSize: 18),)),
                      ((widget.emp["company"]==null)?Expanded( flex:2,child: Text(" ",style:TextStyle(fontSize: 18),)):Expanded( flex:2,child: Text(widget.emp["company"]["name"],style:TextStyle(fontSize: 18),))),
                    ],
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );

  }
}
