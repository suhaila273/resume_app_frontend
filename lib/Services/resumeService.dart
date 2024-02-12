import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resume_app/Models/resumeModel.dart';



class ResumeApiService
{

  Future<List<Resume>> getResume() async{
    var client= http.Client();
    var apiUrl=Uri.parse("http://192.168.0.104:3001/api/resume/viewresume");

    var response= await client.get(apiUrl);
    if(response.statusCode==200)
    {
      return resumeFromJson(response.body);
    }
    else
    {
      return [];
    }

  }
  Future<dynamic> sendData(String userId,String profile,String education,String skills,String achievments,String certifications) async
  {
    var client =http.Client();
    var apiUrl= Uri.parse("http://192.168.0.104:3001/api/resume/addresume");

    var response =await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type" : "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "userId": userId,
          "profile": profile,
          "education": education,
          "skills": skills,
          "achievments": achievments,
          "certifications": certifications,
        })
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("failed to post");
    }
  }


}