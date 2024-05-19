part of 'computer_mcq_cubit.dart';

abstract class ComputerMcqState {}

final class ComputerMcqInitial extends ComputerMcqState {}

final class ComputerMcqLoadingState extends ComputerMcqState {}

final class ComputerMcqLoadedState extends ComputerMcqState {
  final List<MCQModel> computerMCQ;
  ComputerMcqLoadedState(this.computerMCQ);
}

final class ComputerMcqNextState extends ComputerMcqState {}

final class McqSubmittedState extends ComputerMcqState {
  final List<MCQSubmittedModel> mcqSumbmitted;
  McqSubmittedState(this.mcqSumbmitted);
}

final class ComputerMcqErrorState extends ComputerMcqState {
  final String error;
  ComputerMcqErrorState(this.error);
}
