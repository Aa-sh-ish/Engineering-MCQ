import 'package:engineering_mcq/auth/blocs/loginblocs/login_blocs.dart';
import 'package:engineering_mcq/auth/blocs/loginblocs/login_state.dart';
import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:engineering_mcq/core/blocs/rankblocs/bloc/rank_blocs_bloc.dart';
import 'package:engineering_mcq/core/pages/profile_page/widgets/logout_button.dart';
import 'package:engineering_mcq/core/pages/profile_page/widgets/rank_data_get_state.dart';
import 'package:engineering_mcq/core/pages/profile_page/widgets/rank_data_initial_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, 35),
      ChartData(2, 23),
      ChartData(3, 34),
      ChartData(4, 25),
      ChartData(5, 40)
    ];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 60,
                  child: ClipOval(
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4XmhdQxeHPYSPQu2UG_IpMYYIkM96UxdTWw&usqp=CAU',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocConsumer<LoginBlocs, LoginState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is LoggedInstate) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.h),
                          border: Border.all(
                              color: AppConst.knavypurple4, width: 3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                text: state.users.username
                                    .toString()
                                    .toUpperCase(),
                                textstyle: appstyle(
                                    20, AppConst.knavypurple4, FontWeight.bold),
                                height: 30,
                                width: 150,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ReusableText(
                                    text:
                                        "Daily Exam : ${state.users.weeklyNumber}",
                                    textstyle: appstyle(20,
                                        AppConst.knavypurple4, FontWeight.w500),
                                    height: 30,
                                    width: 140,
                                  ),
                                  ReusableText(
                                    text:
                                        "Weekly Exam :${state.users.monlhlyNumber}",
                                    textstyle: appstyle(20,
                                        AppConst.knavypurple4, FontWeight.w500),
                                    height: 30,
                                    width: 150,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.h),
                        border:
                            Border.all(color: AppConst.knavypurple4, width: 3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: "xxxxxx-xxxxx",
                              textstyle: appstyle(
                                  20, AppConst.knavypurple4, FontWeight.w500),
                              height: 30,
                              width: 150,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReusableText(
                                  text: "Daily Exam : xxx",
                                  textstyle: appstyle(20, AppConst.knavypurple4,
                                      FontWeight.w500),
                                  height: 30,
                                  width: 140,
                                ),
                                ReusableText(
                                  text: "Weekly Exam :xxx",
                                  textstyle: appstyle(20, AppConst.knavypurple4,
                                      FontWeight.w500),
                                  height: 30,
                                  width: 150,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              BlocConsumer<RankBlocsBloc, RankBlocsState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is RankGetState) {
                    final List<ChartData> regularData = [
                      ChartData(1, state.rank.regularRank.exam1.toDouble()),
                      ChartData(2, state.rank.regularRank.exam2.toDouble()),
                      ChartData(3, state.rank.regularRank.exam3.toDouble()),
                      ChartData(4, state.rank.regularRank.exam4.toDouble()),
                      ChartData(5, state.rank.regularRank.exam5.toDouble())
                    ];
                    final List<ChartData> dailyData = [
                      ChartData(1, state.rank.dailyRank.exam1.toDouble()),
                      ChartData(2, state.rank.dailyRank.exam2.toDouble()),
                      ChartData(3, state.rank.dailyRank.exam3.toDouble()),
                      ChartData(4, state.rank.dailyRank.exam4.toDouble()),
                      ChartData(5, state.rank.dailyRank.exam5.toDouble())
                    ];
                    final List<ChartData> weeklyData = [
                      ChartData(1, state.rank.weeklyRank.exam1.toDouble()),
                      ChartData(2, state.rank.weeklyRank.exam2.toDouble()),
                      ChartData(3, state.rank.weeklyRank.exam3.toDouble()),
                      ChartData(4, state.rank.weeklyRank.exam4.toDouble()),
                      ChartData(5, state.rank.weeklyRank.exam5.toDouble())
                    ];
                    return RankDataGetState(
                        regularData: regularData,
                        dailyData: dailyData,
                        weeklyData: weeklyData);
                  }
                  return RankInitialState(chartData: chartData);
                },
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                    alignment: Alignment.bottomRight, child: LogoutButton()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
