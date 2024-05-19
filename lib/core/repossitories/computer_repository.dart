import 'package:dio/dio.dart';
import 'package:engineering_mcq/core/models/mcq.question.dart';
import 'package:engineering_mcq/core/repossitories/api/api.dart';

class ComputerRepository {
  API api = API();

  Future<List<MCQModel>> getComputerQuestions() async {
    try {
      Response response = await api.sendRequest.get("/computer");
      List<dynamic> responseMaps = response.data;
      return responseMaps.map((map) => MCQModel.fromJson(map)).toList();
    } catch (error) {
      rethrow;
    }
  }
}
