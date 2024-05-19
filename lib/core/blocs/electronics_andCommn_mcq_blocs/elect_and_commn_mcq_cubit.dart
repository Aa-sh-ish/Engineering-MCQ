import 'package:engineering_mcq/core/models/mcq.question.dart';
import 'package:engineering_mcq/core/models/mcq.submit.dart';
import 'package:engineering_mcq/core/repossitories/electro&commn_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'elect_and_commn_mcq_state.dart';

class ElectronicsAndCommunicatinBlocs extends Cubit<ElectAndCommnMcqState> {
  ElectronicsAndCommunicatinBlocs() : super(ElectAndCommnMcqInitial()) {
    fetcMCQ();
  }

  ElectronicsAndCommunicationRepository electronicsAndCommunicationRepository =
      ElectronicsAndCommunicationRepository();
  List<MCQSubmittedModel> mcqList = [];

  void fetcMCQ() async {
    try {
      emit(ElectAndCommnMcqLoadingState());
      List<MCQModel> mCQs = await electronicsAndCommunicationRepository
          .getElectronicsAndCommunicationQuestions();
      emit(ElectAndCommnMcqLoadedState(electandMCQ: mCQs));
    } catch (e) {
      emit(
        ElectAndCommnMcqErrorState(
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
