// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:engineering_mcq/common/blocs/cubit/ad_cubits_cubit.dart';
import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/mcqtiles.dart';
import 'package:engineering_mcq/common/widgets/outlinebutton.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:engineering_mcq/core/blocs/computer_mcq_blocs/cubit/computer_mcq_cubit.dart';
import 'package:engineering_mcq/core/models/mcq.submit.dart';
import 'package:engineering_mcq/core/pages/computer_mcq_page/widgets/exam_loading_error_state.dart';
import 'package:engineering_mcq/core/pages/computer_mcq_page/widgets/exam_loading_state.dart';
import 'package:engineering_mcq/core/pages/computer_mcq_page/widgets/mcq_submitted_page.dart';

class ComputerMCQPage extends StatefulWidget {
  const ComputerMCQPage({super.key});

  @override
  State<ComputerMCQPage> createState() => _ComputerMCQPageState();
}

class _ComputerMCQPageState extends State<ComputerMCQPage> {
  String values = "";
  String selectedOption = '';
  final PageController _pageController = PageController();
  List<MCQSubmittedModel> itemList = [];

  @override
  void initState() {
    BlocProvider.of<AdCubitsCubit>(context).initializeBanner_2();
    BlocProvider.of<AdCubitsCubit>(context).initializeFullpageBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComputerMcqCubit, ComputerMcqState>(
      builder: (context, state) {
        if (state is ComputerMcqLoadingState) {
          return const Scaffold(body: ExamLoadingState());
        }
        if (state is ComputerMcqLoadedState) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 100.h),
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: AppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: AppConst.knavypurple3,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(60),
                    ),
                  ),
                  title: TimeCounter(onPressed: () {
                    BlocProvider.of<ComputerMcqCubit>(context).submit();
                  }),
                ),
              ),
            ),
            body: PageView.builder(
              reverse: false,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 25,
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: ReusableText(
                          height: 100,
                          width: double.infinity,
                          text:
                              "${index + 1}. ${state.computerMCQ[index].question}",
                          textstyle: appstyle(
                            20,
                            AppConst.knavypurpledark,
                            FontWeight.bold,
                          ),
                        ),
                      ),
                      RadioListTile(
                        title: MCQTile(text: state.computerMCQ[index].option1),
                        value: state.computerMCQ[index].option1,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        selectedTileColor: AppConst.kGreen,
                        title: MCQTile(text: state.computerMCQ[index].option2),
                        value: state.computerMCQ[index].option2,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: MCQTile(text: state.computerMCQ[index].option3),
                        value: state.computerMCQ[index].option3,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: MCQTile(text: state.computerMCQ[index].option4),
                        value: state.computerMCQ[index].option4,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Visibility(
                            visible: (index == 0) ? false : true,
                            child: CustomOutlineButton(
                              textheight: 45,
                              textwidth: 100,
                              ontap: () {
                                _pageController.previousPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                                BlocProvider.of<ComputerMcqCubit>(context)
                                    .removeLastItem();
                              },
                              width: 150,
                              height: 60.h,
                              borradius: 15,
                              borcolor: Colors.black,
                              text: "<< ",
                              textstyle:
                                  appstyle(320, Colors.green, FontWeight.bold),
                            ),
                          ),
                          CustomOutlineButton(
                            textheight: 45,
                            textwidth: 70,
                            ontap: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                              if (index == 25 - 1) {
                                BlocProvider.of<ComputerMcqCubit>(context)
                                    .itemaddtoList(
                                        state.computerMCQ[index].question,
                                        state.computerMCQ[index].rightanswer,
                                        state.computerMCQ[index].rightanswer
                                                    .toLowerCase() ==
                                                selectedOption.toLowerCase()
                                            ? true
                                            : false,
                                        state.computerMCQ[index].hint);
                                BlocProvider.of<ComputerMcqCubit>(context)
                                    .submit();
                              } else {
                                BlocProvider.of<ComputerMcqCubit>(context)
                                    .itemaddtoList(
                                        state.computerMCQ[index].question,
                                        state.computerMCQ[index].rightanswer,
                                        state.computerMCQ[index].rightanswer
                                                    .toLowerCase() ==
                                                selectedOption.toLowerCase()
                                            ? true
                                            : false,
                                        state.computerMCQ[index].hint);
                              }
                            },
                            width: 150,
                            height: 60.h,
                            borradius: 15,
                            borcolor: Colors.black,
                            text: (index == 25 - 1) ? "Submit" : ">>",
                            textstyle:
                                appstyle(320, Colors.green, FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
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
                    child: SizedBox(
                      height: 1.h,
                    ),
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
          );
        }
        if (state is ComputerMcqErrorState) {
          return const Scaffold(
            body: ExamLoadingErrorState(),
          );
        }
        if (state is McqSubmittedState) {
          final List<MCQSubmittedModel> listdata = state.mcqSumbmitted.toList();
          return PopScope(
            onPopInvoked: (vla) async {
              final adCubit = BlocProvider.of<AdCubitsCubit>(context);
              final currentState = adCubit.state;
              if (currentState is InterstitialAdLoadedState) {
                currentState.fullPageAd.show();
                return Future.value(false);
              } else {
                return Future.value(true);
              }
            },
            child: SafeArea(
              child: Scaffold(
                body: MCQSubmittedPage(listdata: listdata, state: state),
              ),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

// ignore: must_be_immutable
class TimeCounter extends StatelessWidget {
  Function onPressed;
  TimeCounter({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppConst.kLight)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TimerCountdown(
          enableDescriptions: false,
          colonsTextStyle: appstyle(20, AppConst.kLight, FontWeight.w500),
          timeTextStyle: appstyle(20, AppConst.kLight, FontWeight.w500),
          format: CountDownTimerFormat.hoursMinutesSeconds,
          endTime: DateTime.now().add(
            const Duration(minutes: 30),
          ),
          onEnd: () {
            onPressed;
          },
        ),
      ),
    );
  }
}
