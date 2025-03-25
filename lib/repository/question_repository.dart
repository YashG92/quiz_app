import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QuestionRepository extends GetxController{
  static QuestionRepository get instance => Get.find();

  final url = 'https://the-trivia-api.com/v2/questions';

  Future<List<dynamic>?> fetchQuestions() async{
    try{
      var response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        return data;
      }
    }catch(e){
      print(e);
    }
  }
}