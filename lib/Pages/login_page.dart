import 'package:flutter/material.dart';
import 'package:resume_app/Pages/register_page.dart';
import 'package:resume_app/Pages/resume_menu.dart';
import 'package:resume_app/Pages/view_page.dart';
import 'package:resume_app/Services/userService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name1=new TextEditingController();
  TextEditingController pass1=new TextEditingController();

  void SendValuesToApi() async {

    final response = await UserApiService().loginData(name1.text, pass1.text);
    if(response["status"]=="success")
    {
      String userId=response["userdata"]["_id"].toString();
      SharedPreferences.setMockInitialValues({});
      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString("userId", userId);
      print("successfully login");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResumeMenu()));
    }
    else if(response["status"]=="invalid username")
    {
      print("Invalid username");
    }
    else if(response["status"]=="invalid password")
    {
      print("Invalid password");
    }
    else
    {
      print("Error");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.note_alt_outlined,color: Colors.white,),
        title: Text("Resume App",style: TextStyle(color: Colors.white),),
        backgroundColor:Color(0xFF1D637C) ,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 70,),
              Text("Sign In here!",style: TextStyle(color: Colors.black,fontSize: 16),),
              SizedBox(height: 50,),
              TextField(
                controller: name1,
                decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter valid username",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: pass1,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter password",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 25,),
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
                    onPressed:SendValuesToApi, child:Text("Log In")),
              ),
              SizedBox(height: 45,),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Text("Don't have an account?",style: TextStyle(color: Colors.black,fontSize: 16),),
                  SizedBox(width: 10,),
                  SizedBox(
                    height: 25,
                    width: 130,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF1D637C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                        }, child:Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
