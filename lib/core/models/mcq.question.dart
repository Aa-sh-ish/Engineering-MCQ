class MCQModel {
  String id;
  String question;
  String option1;
  String option2;
  String option3;
  String option4;
  String rightanswer;
  String? hint;

  MCQModel(
      {required this.id,
      required this.question,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.option4,
      required this.rightanswer,
      this.hint});

  factory MCQModel.fromJson(Map<String, dynamic> json) => MCQModel(
      id: json["_id"],
      question: json["question"],
      option1: json["option1"],
      option2: json["option2"],
      option3: json["option3"],
      option4: json["option4"],
      rightanswer: json["rightanswer"],
      hint: json['hint']);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4,
        "rightanswer": rightanswer,
        'hint': 'hint'
      };
}
