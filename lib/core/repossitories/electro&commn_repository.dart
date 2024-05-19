// ignore: file_names
import 'package:dio/dio.dart';
import 'package:engineering_mcq/core/models/mcq.question.dart';
import 'package:engineering_mcq/core/repossitories/api/api.dart';

class ElectronicsAndCommunicationRepository {
  API api = API();

  Future<List<MCQModel>> getElectronicsAndCommunicationQuestions() async {
    try {
      Response response = await api.sendRequest.get("/electronics");
      List<dynamic> responseMaps = response.data;
      return responseMaps.map((map) => MCQModel.fromJson(map)).toList();
    } catch (error) {
      rethrow;
    }
  }
}
