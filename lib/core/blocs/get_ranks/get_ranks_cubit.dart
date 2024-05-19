import 'package:bloc/bloc.dart';
import 'package:engineering_mcq/auth/model/usermodel.dart';
import 'dart:convert';
import 'package:engineering_mcq/common/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
part 'get_ranks_state.dart';

class GetRanksCubit extends Cubit<GetRanksState> {
  GetRanksCubit() : super(GetRanksInitial());
  void fetchAllUsers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('userToken');
    final String? userId = prefs.getString('userId');

    try {
      emit(RankLoadingState());
      var response = await http.get(
        Uri.parse("${ApiProvider().baseUrl}api/users/"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> responseMaps = jsonDecode(response.body);
        List<Users> usersList =
            responseMaps.map((map) => Users.fromJson(map)).toList();
        usersList
            .sort((a, b) => b.regularNumber!.compareTo(a.regularNumber as int));
        int userIndex = usersList.indexWhere((user) => user.id == userId);
        emit(RanksLoadedState(rank: " ${userIndex + 1}"));
      } else {
        emit(RanksLoadingErrorState("Error Getting Ranks"));
      }
    } catch (e) {
      emit(RanksLoadingErrorState(e.toString()));
    }
  }
}
