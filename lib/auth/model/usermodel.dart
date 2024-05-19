class Users {
  String? id;
  String? username;
  String? email;
  String? userType;
  bool? monthlyPackege;
  bool? weeklyExam;
  int? weeklyNumber;
  int? monlhlyNumber;
  int? regularNumber;

  Users({
    this.id,
    this.username,
    this.email,
    this.userType,
    this.monthlyPackege,
    this.weeklyExam,
    this.weeklyNumber,
    this.monlhlyNumber,
    this.regularNumber,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        userType: json["userType"],
        monthlyPackege: json["monthlyPackege"],
        weeklyExam: json["weeklyExam"],
        weeklyNumber: json["weeklyNumber"],
        monlhlyNumber: json["monlhlyNumber"],
        regularNumber: json["regularNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "userType": userType,
        "monthlyPackege": monthlyPackege,
        "weeklyExam": weeklyExam,
        "weeklyNumber": weeklyNumber,
        "monlhlyNumber": monlhlyNumber,
        "regularNumber": regularNumber
      };
}
