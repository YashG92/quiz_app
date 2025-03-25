class QuestionModel {
  String id;
  String category;
  Map<String, dynamic> question;
  List<dynamic>? incorrectAnswers;
  List<dynamic>? tags;
  List<dynamic>? regions;
  String correctAnswer;
  String type;
  String difficulty;

  QuestionModel({
    required this.id,
    required this.category,
    required this.question,
    required this.incorrectAnswers,
    required this.tags,
    required this.regions,
    required this.correctAnswer,
    required this.type,
    required this.difficulty,
  });

static QuestionModel empty()=> QuestionModel(
  id: '',
  category: '',
  question: {},
  incorrectAnswers: [],
  tags: [],
  regions: [],
  correctAnswer: '',
  type: '',
  difficulty: '',
);

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    final data = json;
    if(data.isNotEmpty){
      print(data['incorrectAnswers']);
      return QuestionModel(
        id: data["id"],
        category: data["category"],
        question: data["question"],
        incorrectAnswers: data["incorrectAnswers"] ?? [],
        tags: data["tags"] ?? [] ,
        regions: data["regions"] ?? [],
        correctAnswer: data["correctAnswer"],
        type: data["type"],
        difficulty: data["difficulty"],
      );
    }else{
      return QuestionModel.empty();
    }
  }
}
