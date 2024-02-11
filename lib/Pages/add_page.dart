import 'package:flutter/material.dart';
import 'package:resume_app/Services/resumeService.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController id1=new TextEditingController();
  TextEditingController profile1=new TextEditingController();
  TextEditingController education1=new TextEditingController();
  TextEditingController skills1=new TextEditingController();
  TextEditingController achievments1=new TextEditingController();
  TextEditingController certification1=new TextEditingController();

  //String userid="";

  void SendValuesToApiResume() async {

    final response = await ResumeApiService().sendData(
      id1.text,
        profile1.text,
        education1.text,
        skills1.text,
        achievments1.text,
        certification1.text);

    if(response["status"]=="success")
    {
      print("successfully added");
    }
    else
    {
      print("Error");
    }

  }

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("My Resume",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF1D637C),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextField(
                  controller: id1,
                  decoration: InputDecoration(
                      labelText: "User Id",
                      hintText: "Enter user id",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: profile1,
                  decoration: InputDecoration(
                      labelText: "Profile",
                      hintText: "Enter profile",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: education1,
                  decoration: InputDecoration(
                      labelText: "Education",
                      hintText: "Enter education details",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: skills1,
                  decoration: InputDecoration(
                      labelText: "Skills",
                      hintText: "Enter soft and technical skills",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: achievments1,
                  decoration: InputDecoration(
                      labelText: "Achievemnets",
                      hintText: "Enter your achievements",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: certification1,
                  decoration: InputDecoration(
                      labelText: "Certification",
                      hintText: "Enter certification details",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1D637C),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onPressed: SendValuesToApiResume, child: Text("ADD"))),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
