import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:engineering_mcq/core/blocs/electronics_andCommn_mcq_blocs/elect_and_commn_mcq_cubit.dart';
import 'package:engineering_mcq/core/blocs/rankblocs/bloc/rank_blocs_bloc.dart';
import 'package:engineering_mcq/core/models/mcq.submit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MCQSubmittedPage extends StatefulWidget {
  const MCQSubmittedPage({
    super.key,
    required this.listdata,
    required this.state,
  });

  final List<MCQSubmittedModel> listdata;
  final McqSubmittedState state;

  @override
  State<MCQSubmittedPage> createState() => _MCQSubmittedPageState();
}

class _MCQSubmittedPageState extends State<MCQSubmittedPage> {
  @override
  void initState() {
    BlocProvider.of<RankBlocsBloc>(context).add(RegularExamRankUpdate(
        widget.listdata.where((item) => item.correctanswer == true).length));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                color: AppConst.kLight,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: AppConst.knavypurple2,
                    offset: Offset(0, 5),
                    spreadRadius: 3,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppConst.knavypurple4, width: 2)),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text:
                          " Right Answers : ${widget.listdata.where((item) => item.correctanswer == true).length.toString()}",
                      textstyle: appstyle(20, AppConst.kGreen, FontWeight.w500),
                      width: 200,
                      height: 30),
                  ReusableText(
                      text:
                          " Wrong Answers : ${25 - widget.listdata.where((item) => item.correctanswer == true).length}",
                      textstyle: appstyle(
                        20,
                        AppConst.kred.withOpacity(0.4),
                        FontWeight.w500,
                      ),
                      width: 200,
                      height: 30),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 3,
          color: AppConst.knavypurple4,
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: AppConst.kHeight * 0.75,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: widget.listdata.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppConst.kLight,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: widget
                                      .state.mcqSumbmitted[index].correctanswer
                                  ? AppConst.knavypurple4
                                  : Colors.red.withOpacity(0.3),
                              offset: const Offset(0, 5),
                              spreadRadius: 3,
                            )
                          ],
                          border: Border.all(
                            color:
                                widget.state.mcqSumbmitted[index].correctanswer
                                    ? AppConst.knavypurple4
                                    : Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ReusableText(
                              width: AppConst.kWidth * 0.8,
                              text:
                                  "Q.No${index + 1}\n${widget.state.mcqSumbmitted[index].question}",
                              textstyle: appstyle(20, AppConst.knavypurpledark,
                                  FontWeight.w400),
                            ),
                            ReusableText(
                              width: AppConst.kWidth * 0.8,
                              text:
                                  "......................................  \n${widget.state.mcqSumbmitted[index].rightanswer} ",
                              textstyle: appstyle(
                                  20, AppConst.kGreen, FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
