part of 'elect_and_commn_mcq_cubit.dart';

abstract class ElectAndCommnMcqState {}

final class ElectAndCommnMcqInitial extends ElectAndCommnMcqState {}

final class ElectAndCommnMcqLoadingState extends ElectAndCommnMcqState {}

final class ElectAndCommnMcqLoadedState extends ElectAndCommnMcqState {
  final List<MCQModel> electandMCQ;
  ElectAndCommnMcqLoadedState({required this.electandMCQ});
}

final class ElectAndCommnMcqNextState extends ElectAndCommnMcqState {}

final class McqSubmittedState extends ElectAndCommnMcqState {
  final List<MCQSubmittedModel> mcqSumbmitted;
  McqSubmittedState(this.mcqSumbmitted);
}

final class ElectAndCommnMcqErrorState extends ElectAndCommnMcqState {
  final String error;
  ElectAndCommnMcqErrorState({required this.error});
}
