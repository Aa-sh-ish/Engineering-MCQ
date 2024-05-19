import 'package:engineering_mcq/common/routes/router.dart';
import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 875),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Engineering Guru',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppConst.knavypurple3),
          useMaterial3: true,
        ),
        onGenerateRoute: Routes.onGenerateRoure,
        initialRoute: "/splashScreen",
      ),
    );
  }
}
