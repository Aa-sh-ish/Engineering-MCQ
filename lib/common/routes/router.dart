import 'package:engineering_mcq/auth/blocs/forgot_pass_blocs/forgot_pass_bloc.dart';
import 'package:engineering_mcq/auth/blocs/loginblocs/login_blocs.dart';
import 'package:engineering_mcq/auth/blocs/registerblocs/authblocs.dart';
import 'package:engineering_mcq/auth/pages/forgot_passwordpage.dart';
import 'package:engineering_mcq/auth/pages/loginpage.dart';
import 'package:engineering_mcq/auth/pages/registerpage.dart';
import 'package:engineering_mcq/common/blocs/cubit/ad_cubits_cubit.dart';
import 'package:engineering_mcq/core/blocs/civil_mcq_blocs/civil_cubits.dart';
import 'package:engineering_mcq/core/blocs/computer_mcq_blocs/cubit/computer_mcq_cubit.dart';
import 'package:engineering_mcq/core/blocs/electronics_andCommn_mcq_blocs/elect_and_commn_mcq_cubit.dart';
import 'package:engineering_mcq/core/blocs/get_ranks/get_ranks_cubit.dart';
import 'package:engineering_mcq/core/blocs/rankblocs/bloc/rank_blocs_bloc.dart';
import 'package:engineering_mcq/core/pages/civil_mcq_page/civil_mcq_page.dart';
import 'package:engineering_mcq/core/pages/computer_mcq_page/computer_mcq_page.dart';
import 'package:engineering_mcq/core/pages/elect_and_commn_page.dart/computer_mcq_page.dart';
import 'package:engineering_mcq/core/pages/landingpage/landingpage.dart';
import 'package:engineering_mcq/core/pages/model_question_page/model_question.dart';
import 'package:engineering_mcq/core/pages/profile_page/profile.dart';
import 'package:engineering_mcq/core/pages/splashscreen/splash.dart';
import 'package:engineering_mcq/core/pages/syllabus_page/syllabus_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route? onGenerateRoure(RouteSettings settings) {
    switch (settings.name) {
      case "/landingPage":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AdCubitsCubit(),
            child: BlocProvider(
              create: (context) => LoginBlocs(),
              child: BlocProvider(
                create: (context) => GetRanksCubit(),
                child: const LandingPage(),
              ),
            ),
          ),
        );

      case "/computermcqPage":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ComputerMcqCubit(),
            child: BlocProvider(
              create: (context) => AdCubitsCubit(),
              child: BlocProvider(
                create: (context) => RankBlocsBloc(),
                child: const ComputerMCQPage(),
              ),
            ),
          ),
        );

      case "/elect_and_commn_mcqPage":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ElectronicsAndCommunicatinBlocs(),
            child: BlocProvider(
              create: (context) => AdCubitsCubit(),
              child: BlocProvider(
                create: (context) => RankBlocsBloc(),
                child: const ElectronicsAndCommunicationMcqPage(),
              ),
            ),
          ),
        );

      case "/registerPage":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterBlocs(),
            child: const RegisterPage(),
          ),
        );
      case "/loginPage":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBlocs(),
            child: const LoginPage(),
          ),
        );

      case "/syllabus":
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => SyllabusPage(
            syllabsApi: arguments["syllabusApi"],
          ),
        );

      case "/modelQuestionPage":
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ModelQuestionPage(
            modelQuestionApi: arguments["modelQuestionApi"],
          ),
        );

      case "/profilePage":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBlocs(),
            child: BlocProvider(
              create: (context) => RankBlocsBloc(),
              child: const ProfilePage(),
            ),
          ),
        );

      case "/splashScreen":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginBlocs(),
                  child: const SplashScreen(),
                ));

      case "/forgotPassPage":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ForgotPassBloc(),
            child: ForgotPassswordPage(),
          ),
        );

      case "/civilmcqPage":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CivilBlocs(),
            child: BlocProvider(
              create: (context) => AdCubitsCubit(),
              child: BlocProvider(
                create: (context) => RankBlocsBloc(),
                child: const CivilMcqPage(),
              ),
            ),
          ),
        );
    }
    return null;
  }
}
