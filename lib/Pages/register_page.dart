import 'package:flutter/material.dart';
import 'package:resume_app/Services/userService.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name1= new TextEditingController();
  TextEditingController password1= new TextEditingController();
  TextEditingController dob1= new TextEditingController();
  TextEditingController email1= new TextEditingController();
  TextEditingController phone1= new TextEditingController();

  void SendValuesToApiRegister() async {

    final response = await UserApiService().sendData(
        name1.text,
        password1.text,
        dob1.text,
        email1.text,
        phone1.text);
    if(response["status"]=="success")
    {
      print("successfully registerd");
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
          title: Text("Registeration Page",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF1D637C),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextField(
                  controller: name1,
                  decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter your name",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: password1,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter password",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: dob1,
                  decoration: InputDecoration(
                      labelText: "Date of Birth",
                      hintText: "Enter your dob",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: email1,
                  decoration: InputDecoration(
                      labelText: "Email Id",
                      hintText: "Enter your email id",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: phone1,
                  decoration: InputDecoration(
                      labelText: "Phone no",
                      hintText: "Enter phone no",
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
                        onPressed: SendValuesToApiRegister, child: Text("Register"))),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
