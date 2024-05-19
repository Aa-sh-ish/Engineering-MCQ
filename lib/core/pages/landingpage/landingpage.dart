import 'package:engineering_mcq/auth/blocs/loginblocs/login_blocs.dart';
import 'package:engineering_mcq/auth/blocs/loginblocs/login_state.dart';
import 'package:engineering_mcq/common/blocs/cubit/ad_cubits_cubit.dart';
import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/heightspacer.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:engineering_mcq/common/widgets/shimmerror.dart';
import 'package:engineering_mcq/core/blocs/get_ranks/get_ranks_cubit.dart';
import 'package:engineering_mcq/core/pages/landingpage/widgets/mcqbox.dart';
import 'package:engineering_mcq/core/pages/landingpage/widgets/modelquestionbox.dart';
import 'package:engineering_mcq/core/pages/landingpage/widgets/subscriptionbox.dart';
import 'package:engineering_mcq/core/pages/landingpage/widgets/syllabusbox.dart';
import 'package:engineering_mcq/core/pages/landingpage/widgets/userstatusbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    BlocProvider.of<AdCubitsCubit>(context).initializeBanner_1();
    BlocProvider.of<GetRanksCubit>(context).fetchAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConst.kLight,
        body: Column(
          children: [
            Container(
              height: 100.h,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 4,
                      offset: Offset(0, 4),
                      color: AppConst.knavypurple2,
                    )
                  ],
                  color: AppConst.knavypurple4,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ShimmerError(
                    basecolor: AppConst.knavypurpledark,
                    highlightcolor: AppConst.kLight,
                    respose: ReusableText(
                      text: "      Engineering MCQ",
                      textstyle: appstyle(
                          30, AppConst.knavypurpledark, FontWeight.bold),
                      height: 50,
                      width: 300,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/profilePage",
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              color: Colors.white,
                              spreadRadius: 1)
                        ],
                      ),
                      child: const CircleAvatar(
                        backgroundColor: AppConst.kLight,
                        radius: 20,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const HeightSpace(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 200,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    BlocConsumer<LoginBlocs, LoginState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is LoggedInstate) {
                          return buildUserProfile(
                              context: context,
                              userName:
                                  state.users.username.toString().toUpperCase(),
                              dailyRank: state.users.weeklyNumber.toString(),
                              weeklyRank: state.users.monlhlyNumber.toString());
                        } else {
                          return Container();
                        }
                      },
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                color: Colors.white,
                                spreadRadius: 3)
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 60,
                          child: ClipOval(
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4XmhdQxeHPYSPQu2UG_IpMYYIkM96UxdTWw&usqp=CAU',
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SyllabusBox(),
                      ModelQuestionBox(),
                    ],
                  ),
                  HeightSpace(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MCQBox(),
                      SubscriptionBox(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BlocConsumer<AdCubitsCubit, AdCubitsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AdLoadingState) {
              return SizedBox(
                height: 1.h,
              );
            }
            if (state is AdErrorState) {
              return SizedBox(
                height: 50.h,
                // child: Text(state.error),
              );
            }

            if (state is BannerAdLoadedState) {
              return SizedBox(
                height: 50.h,
                child: AdWidget(ad: state.bannerAd),
              );
            }
            return SizedBox(
              height: 50.h,
              child: const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
