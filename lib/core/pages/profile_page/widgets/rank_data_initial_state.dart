import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RankInitialState extends StatelessWidget {
  const RankInitialState({
    super.key,
    required this.chartData,
  });

  final List<ChartData> chartData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: ReusableText(
            text: "Regular Exam",
            textstyle: appstyle(20, AppConst.knavypurple4, FontWeight.w500),
            height: 30,
            width: 150,
          ),
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: SfCartesianChart(
            isTransposed: true,
            series: <CartesianSeries>[
              BarSeries<ChartData, double>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  color: AppConst.knavypurple3,
                  width: 0.6.h,
                  spacing: 0.3)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: ReusableText(
            text: "Daily Exam",
            textstyle: appstyle(20, AppConst.knavypurple4, FontWeight.w500),
            height: 30,
            width: 150,
          ),
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: SfCartesianChart(
            isTransposed: true,
            series: <CartesianSeries>[
              BarSeries<ChartData, double>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  color: AppConst.knavypurple3,
                  width: 0.6.h,
                  spacing: 0.3)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: ReusableText(
            text: "Weekly Exam",
            textstyle: appstyle(20, AppConst.knavypurple4, FontWeight.w500),
            height: 30,
            width: 150,
          ),
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: SfCartesianChart(
            isTransposed: true,
            series: <CartesianSeries>[
              BarSeries<ChartData, double>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  color: AppConst.knavypurple3,
                  width: 0.6.h,
                  spacing: 0.3)
            ],
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final double x;
  final double y;
}
