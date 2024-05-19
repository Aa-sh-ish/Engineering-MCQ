part of 'rank_blocs_bloc.dart';

abstract class RankBlocsState {}

class RankBlocsInitial extends RankBlocsState {}

class RankLoadingState extends RankBlocsState {}

class RankGetState extends RankBlocsState {
  final Rank rank;
  RankGetState(this.rank);
}

class RankGetErrorState extends RankBlocsState {}

class WeeklyRankState extends RankBlocsState {
  final String message;
  WeeklyRankState(this.message);
}

class RegularRankState extends RankBlocsState {
  final String message;
  RegularRankState(this.message);
}

class DailyRankState extends RankBlocsState {
  final String message;
  DailyRankState(this.message);
}

class UpdateErrorState extends RankBlocsState {
  final String errorMessage;
  UpdateErrorState(this.errorMessage);
}
