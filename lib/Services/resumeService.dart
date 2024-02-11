import 'package:http/http.dart' as http;
import 'package:resume_app/Models/resumeModel.dart';



class ResumeApiService
{

  Future<List<Resume>> getResume() async{
    var client= http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/resume/viewresume");

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
}