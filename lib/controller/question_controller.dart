import 'package:get/get.dart';
import 'package:quiz_app/repository/question_repository.dart';

import '../model/question_model.dart';

class QuestionController extends GetxController{
  static QuestionController get  instance => Get.find();

  final questionRepository = Get.put(QuestionRepository());

  RxList<QuestionModel> questionList = <QuestionModel>[].obs;
  RxInt questionNumber = 0.obs;

  Future<void> displayQuestion()async{
     final questions = await questionRepository.fetchQuestions();
     if(questions != null){
       questionList.clear();
       for(var question in questions){
         questionList.add(QuestionModel.fromJson(question));
       }
     }
  }

  List<QuestionModel> questionBasedOnCategory(String category){

    final questions = questionList
        .where((question) => question.category == category)
        .toList();
    questionNumber.value = 0;
    return questions;
  }
}