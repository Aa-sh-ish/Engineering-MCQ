part of 'rank_blocs_bloc.dart';

abstract class RankBlocsEvent {}

class RegularExamRankUpdate extends RankBlocsEvent {
  final int marks;
  RegularExamRankUpdate(this.marks);
}

class DailyExamRankUpdate extends RankBlocsEvent {
  final int marks;
  DailyExamRankUpdate({required this.marks});
}

class WeeklyExamRankUpdate extends RankBlocsEvent {
  final int marks;
  WeeklyExamRankUpdate({required this.marks});
}
