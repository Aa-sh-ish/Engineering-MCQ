import 'package:engineering_mcq/core/models/mcq.question.dart';
import 'package:engineering_mcq/core/models/mcq.submit.dart';
import 'package:engineering_mcq/core/repossitories/civil_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'civil_state.dart';

class CivilBlocs extends Cubit<CivilState> {
  CivilBlocs() : super(CivilMcqInitial()) {
    fetcMCQ();
  }

  CivilRepository civilRepository = CivilRepository();
  List<MCQSubmittedModel> mcqList = [];

  void fetcMCQ() async {
    try {
      emit(CivilMcqLoadingState());
      List<MCQModel> mCQs = await civilRepository.civilQuestions();
      emit(CivilMcqLoadedState(civilMCQ: mCQs));
    } catch (e) {
      emit(
        CivilMcqErrorState(
          error: e.toString(),
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
