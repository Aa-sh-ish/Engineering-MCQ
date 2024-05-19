class Rank {
  RankClass regularRank;
  RankClass dailyRank;
  RankClass weeklyRank;
  String id;
  String userId;

  Rank({
    required this.regularRank,
    required this.dailyRank,
    required this.weeklyRank,
    required this.id,
    required this.userId,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        regularRank: RankClass.fromJson(json["regularRank"]),
        dailyRank: RankClass.fromJson(json["dailyRank"]),
        weeklyRank: RankClass.fromJson(json["weeklyRank"]),
        id: json["_id"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "regularRank": regularRank.toJson(),
        "dailyRank": dailyRank.toJson(),
        "weeklyRank": weeklyRank.toJson(),
        "_id": id,
        "userId": userId,
      };
}

class RankClass {
  int exam1;
  int exam2;
  int exam3;
  int exam4;
  int exam5;

  RankClass({
    required this.exam1,
    required this.exam2,
    required this.exam3,
    required this.exam4,
    required this.exam5,
  });

  factory RankClass.fromJson(Map<String, dynamic> json) => RankClass(
        exam1: json["exam1"],
        exam2: json["exam2"],
        exam3: json["exam3"],
        exam4: json["exam4"],
        exam5: json["exam5"],
      );

  Map<String, dynamic> toJson() => {
        "exam1": exam1,
        "exam2": exam2,
        "exam3": exam3,
        "exam4": exam4,
        "exam5": exam5,
      };
}
