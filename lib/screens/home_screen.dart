import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/question_based_on_category.dart';

import '../controller/question_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = QuestionController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Obx(
            ()=> Column(
              children: [
                ListView.separated(
                  itemCount: controller.questionList.length,
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final categoryList = controller.questionList.map((e)=> e.category).toList();
                      return ListTile(
                        onTap: ()=> Get.to(()=> QuestionBasedOnCategory(category: categoryList[index])),
                        title: Text(categoryList[index]),
                      );
                    },
                    separatorBuilder: (_, __) => Divider(),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
