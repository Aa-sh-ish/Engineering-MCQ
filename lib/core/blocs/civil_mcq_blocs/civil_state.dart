part of 'civil_cubits.dart';

abstract class CivilState {}

final class CivilMcqInitial extends CivilState {}

final class CivilMcqLoadingState extends CivilState {}

final class CivilMcqLoadedState extends CivilState {
  final List<MCQModel> civilMCQ;
  CivilMcqLoadedState({required this.civilMCQ});
}

final class McqSubmittedState extends CivilState {
  final List<MCQSubmittedModel> mcqSumbmitted;
  McqSubmittedState(this.mcqSumbmitted);
}

final class CivilMcqErrorState extends CivilState {
  final String error;
  CivilMcqErrorState({required this.error});
}
