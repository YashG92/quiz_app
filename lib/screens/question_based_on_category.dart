import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/question_controller.dart';

class QuestionBasedOnCategory extends StatelessWidget {
  const QuestionBasedOnCategory({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    final controller = QuestionController.instance;
    final  questions = controller.questionBasedOnCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Obx(
              () {
            if (questions.isEmpty) {
              return const Center(
                child: Text("No questions found for this category."),
              );
            }

            if (controller.questionNumber.value < 0 ||
                controller.questionNumber.value >= questions.length) {
              controller.questionNumber.value = 0;
              return const Center(
                child: Text("Error: Question number out of range."),
              );
            }

            final currentQuestion = questions[controller.questionNumber.value];
            List<String> options = [
              currentQuestion.correctAnswer,
              ...currentQuestion.incorrectAnswers ?? [],
            ];
            options.shuffle();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(category),
                Text(
                    'Question ${controller.questionNumber.value + 1} of ${questions.length}'),
                const SizedBox(height: 16),
                Text(
                  currentQuestion.question['text'],
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                ...options.map((option) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (option == currentQuestion.correctAnswer) {
                          Get.snackbar('Correct', 'You got it right!');
                        } else {
                          Get.snackbar('Wrong', 'You got it wrong!');                        }
                      },
                      child: Text(option),
                    ),
                  );
                }).toList(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (controller.questionNumber.value > 0)
                      ElevatedButton(
                        onPressed: () {
                          controller.questionNumber.value--;
                        },
                        child: const Text('Back'),
                      ),
                    if (controller.questionNumber.value < questions.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          controller.questionNumber.value++;
                        },
                        child: const Text('Next'),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}