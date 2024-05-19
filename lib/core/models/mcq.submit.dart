class MCQSubmittedModel {
  String question;
  String rightanswer;
  bool correctanswer;
  String? hint;

  MCQSubmittedModel({
    required this.question,
    required this.rightanswer,
    required this.correctanswer,
    this.hint,
  });

  factory MCQSubmittedModel.fromJson(Map<String, dynamic> json) =>
      MCQSubmittedModel(
          question: json["question"],
          rightanswer: json["rightanswer"],
          correctanswer: json['isCorrect'],
          hint: json['hint']);

  Map<String, dynamic> toJson() => {
        "question": question,
        "rightanswer": rightanswer,
        "correctanswer": correctanswer,
        'hint': 'hint'
      };
}
