// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:convert';
import 'package:engineering_mcq/common/utils/utils.dart';
import 'package:engineering_mcq/core/models/rank.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'rank_blocs_event.dart';
part 'rank_blocs_state.dart';

class RankBlocsBloc extends Bloc<RankBlocsEvent, RankBlocsState> {
  RankBlocsBloc() : super(RankBlocsInitial()) {
    getRankData() async {
      String? token = await getUserToken();
      if (token != null) {
        emit(RankLoadingState());
        try {
          var response = await http.get(
            Uri.parse("${ApiProvider().baseUrl}aip/ranks/"),
            headers: {
              'Authorization': 'Bearer $token',
            },
          );
          if (response.statusCode == 200) {
            Rank rank = Rank.fromJson(jsonDecode(response.body));
            emit(RankGetState(rank));
          }
        } catch (e) {
          emit(RankGetErrorState());
        }
      }
    }

    getRankData();

    on<WeeklyExamRankUpdate>((event, emit) async {
      try {
        String? token = await getUserToken();
        var response = await http.patch(
            Uri.parse("${ApiProvider().baseUrl}aip/ranks/weekly_rank"),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              "exam1": event.marks,
            });
        if (response.statusCode == 200) {
          emit(WeeklyRankState(jsonDecode(response.body)['message']));
        } else {
          emit(UpdateErrorState(jsonDecode(response.body)['message']));
        }
      } catch (e) {
        emit(UpdateErrorState(e.toString()));
      }
    });

    on<DailyExamRankUpdate>((event, emit) async {
      try {
        String? token = await getUserToken();
        var response = await http.patch(
            Uri.parse("${ApiProvider().baseUrl}aip/ranks/daily_rank"),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              "exam1": event.marks,
            });
        if (response.statusCode == 200) {
          emit(DailyRankState(jsonDecode(response.body)['message']));
        } else {
          emit(UpdateErrorState(jsonDecode(response.body)['message']));
        }
      } catch (e) {
        emit(UpdateErrorState(e.toString()));
      }
    });

    on<RegularExamRankUpdate>((event, emit) async {
      try {
        String? token = await getUserToken();
        var response = await http.patch(
            Uri.parse("${ApiProvider().baseUrl}aip/ranks/regular_rank"),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              "exam1": event.marks.toString(),
            });
        if (response.statusCode == 200) {
          emit(RegularRankState(jsonDecode(response.body)['message']));
        } else {
          emit(UpdateErrorState(jsonDecode(response.body)['message']));
        }
      } catch (e) {
        emit(UpdateErrorState(e.toString()));
      }
    });
  }

  Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('userToken');
    if (token == null) {
      return null;
    } else {
      return token;
    }
  }
}
