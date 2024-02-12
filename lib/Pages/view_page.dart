import 'package:flutter/material.dart';
import 'package:resume_app/Models/resumeModel.dart';
import 'package:resume_app/Pages/add_page.dart';
import 'package:resume_app/Services/resumeService.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Future<List<Resume>> ?data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=ResumeApiService().getResume();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("View All Resume",style: TextStyle(color: Colors.white),),
         /* actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
            }, icon: Icon(Icons.add,color: Colors.white,size: 27,)),
            SizedBox(width: 25,)
          ],*/
          backgroundColor: Color(0xFF1D637C),
        ),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot){
              if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return Card(
                        color: Color(0xFFC0E4F1),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(snapshot.data![index].userId.username,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              subtitle: Text(snapshot.data![index].userId.dob+ "\n"
                                  + snapshot.data![index].userId.phone+"\n"+snapshot.data![index].userId.email
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10,),
                                    Text("PROFILE",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 10,),
                                    Text(snapshot.data![index].profile,style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 10,),
                                    Text("EDUCATION",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 10,),
                                    Text(snapshot.data![index].education,style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 10,),
                                    Text("SKILLS",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 10,),
                                    Text(snapshot.data![index].skills,style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 10,),
                                    Text("ACHIEVEMENTS",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 10,),
                                    Text(snapshot.data![index].achievments,style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 10,),
                                    Text("CERTIFICATION",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 10,),
                                    Text(snapshot.data![index].certifications,style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 10,),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }
              else
              {
                return CircularProgressIndicator();
              }
            }),



      ),
    );
  }
}
