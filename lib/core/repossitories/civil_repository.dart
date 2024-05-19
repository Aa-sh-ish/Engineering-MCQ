import 'package:dio/dio.dart';
import 'package:engineering_mcq/core/models/mcq.question.dart';
import 'package:engineering_mcq/core/repossitories/api/api.dart';

class CivilRepository {
  API api = API();

  Future<List<MCQModel>> civilQuestions() async {
    try {
      Response response = await api.sendRequest.get("/civil");
      List<dynamic> responseMaps = response.data;
      return responseMaps.map((map) => MCQModel.fromJson(map)).toList();
    } catch (error) {
      rethrow;
    }
  }
}
