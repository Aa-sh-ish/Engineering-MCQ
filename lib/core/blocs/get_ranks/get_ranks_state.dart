part of 'get_ranks_cubit.dart';

abstract class GetRanksState {}

final class GetRanksInitial extends GetRanksState {}

final class RankLoadingState extends GetRanksState {}

final class RanksLoadedState extends GetRanksState {
  String rank;
  RanksLoadedState({required this.rank});
}

final class RanksLoadingErrorState extends GetRanksState {
  String error;
  RanksLoadingErrorState(this.error);
}
