import 'package:engineering_mcq/core/models/mcq.question.dart';
import 'package:engineering_mcq/core/models/mcq.submit.dart';
import 'package:engineering_mcq/core/repossitories/computer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'computer_mcq_state.dart';

class ComputerMcqCubit extends Cubit<ComputerMcqState> {
  ComputerMcqCubit() : super(ComputerMcqLoadingState()) {
    fetcMCQ();
  }

  ComputerRepository computerRepository = ComputerRepository();
  List<MCQSubmittedModel> mcqList = [];

  void fetcMCQ() async {
    try {
      emit(ComputerMcqLoadingState());
      List<MCQModel> mCQs = await computerRepository.getComputerQuestions();
      emit(ComputerMcqLoadedState(mCQs));
    } catch (e) {
      emit(
        ComputerMcqErrorState(
          e.toString(),
        ),
      );
    }
  }

  void itemaddtoList(question, rightanswer, correctanswer, hint) {
    mcqList.add(
      MCQSubmittedModel(
        question: question,
        rightanswer: rightanswer,
        correctanswer: correctanswer,
        hint: hint,
      ),
    );
  }

  void removeLastItem() {
    if (mcqList.isNotEmpty) {
      mcqList.removeLast();
    }
  }

  void submit() {
    List<MCQSubmittedModel> modeldata = mcqList;
    emit(McqSubmittedState(modeldata));
  }
}
