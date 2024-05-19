import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/heightspacer.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:engineering_mcq/common/widgets/shimmerror.dart';
import 'package:engineering_mcq/core/blocs/get_ranks/get_ranks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildUserProfile({
  required BuildContext context,
  required String userName,
  required String dailyRank,
  required String weeklyRank,
}) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      decoration: BoxDecoration(
          color: AppConst.knavypurple4,
          boxShadow: const [
            BoxShadow(
              blurRadius: 7,
              spreadRadius: 4,
              offset: Offset(0, 4),
              color: AppConst.knavypurple2,
            )
          ],
          borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.only(
        left: 13.h,
        right: 13.h,
        bottom: 5.h,
        top: 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 70.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                    text: userName,
                    textstyle: appstyle(30, AppConst.kLight, FontWeight.w500),
                    height: 25,
                    width: 150),
                BlocConsumer<GetRanksCubit, GetRanksState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is RanksLoadedState) {
                      return ReusableText(
                          text: "Regular Rank : ${state.rank}",
                          textstyle:
                              appstyle(24, AppConst.kLight, FontWeight.w500),
                          height: 21,
                          width: 150);
                    }
                    return ShimmerError(
                        respose: SizedBox(
                          height: 30.h,
                          width: 30.h,
                        ),
                        basecolor: AppConst.kwhite,
                        highlightcolor: AppConst.knavypurple4);
                  },
                ),
                HeightSpace(height: 10.h),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 70.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ReusableText(
                    text: "Daily Rank :$weeklyRank",
                    textstyle: appstyle(24, AppConst.kLight, FontWeight.w500),
                    height: 20,
                    width: 150,
                  ),
                ),
                HeightSpace(height: 10.h),
                ReusableText(
                  text: "Weekly Rank :$dailyRank",
                  textstyle: appstyle(24, AppConst.kLight, FontWeight.w500),
                  height: 20,
                  width: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
