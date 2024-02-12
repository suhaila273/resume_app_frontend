import 'package:flutter/material.dart';
import 'package:resume_app/Pages/add_page.dart';
import 'package:resume_app/Pages/view_page.dart';

class ResumeMenu extends StatelessWidget {
  const ResumeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("Menu Page",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF1D637C),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1D637C).withOpacity(0.2),
                Colors.white,
                Color(0xFF1D637C).withOpacity(0.4),
              ]
            )
          ),
          //padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage("https://t3.ftcdn.net/jpg/04/75/01/06/360_F_475010683_QcMoX9EuZkjVToNNtXCDbejMo4tIj06i.jpg"),
              ),
              SizedBox(height: 50,),
              SizedBox(
                  height: 45,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1D637C),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
                      }, child: Text("Add Resume"))),

              SizedBox(height: 40,),
              SizedBox(
                  height: 45,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1D637C),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPage()));
                      }, child: Text("View All Resume"))),

            ],
          ),
        ),

      ),
    );
  }
}
