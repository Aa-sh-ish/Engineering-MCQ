// import 'dart:developer';

import 'package:engineering_mcq/common/helper/adhelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'ad_cubits_state.dart';

class AdCubitsCubit extends Cubit<AdCubitsState> {
  AdCubitsCubit() : super(AdInitialState());

  void initializeBanner_1() async {
    emit(AdLoadingState());
    try {
      final ad = BannerAd(
        size: AdSize.banner,
        adUnitId: Adhelper.bannerAd_1(),
        listener: BannerAdListener(
          onAdClosed: (ad) {
            ad.dispose();
          },
          onAdFailedToLoad: (ad, error) {
            emit(AdErrorState(error: error.message.toString()));
          },
        ),
        request: const AdRequest(),
      );

      await ad.load();
      emit(BannerAdLoadedState(bannerAd: ad));
    } catch (error) {
      emit(AdErrorState(error: error.toString()));
    }
  }

  void initializeBanner_2() async {
    emit(AdLoadingState());
    try {
      final ad = BannerAd(
        size: AdSize.banner,
        adUnitId: Adhelper.bannerAd_2(),
        listener: BannerAdListener(
          onAdClosed: (ad) {
            ad.dispose();
          },
          onAdFailedToLoad: (ad, error) {
            emit(AdErrorState(error: error.message.toString()));
          },
        ),
        request: const AdRequest(),
      );

      await ad.load();
      emit(BannerAdLoadedState(bannerAd: ad));
    } catch (error) {
      emit(AdErrorState(error: error.toString()));
    }
  }

  void initializeFullpageBannerAd() async {
    emit(AdLoadingState());
    try {
      InterstitialAd.load(
        adUnitId: Adhelper.fullpageBannerAd(),
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            // log("ad loded");
            emit(InterstitialAdLoadedState(fullPageAd: ad));
          },
          onAdFailedToLoad: (LoadAdError error) {
            // log(error.toString());
            emit(AdErrorState(error: error.toString()));
          },
        ),
      );
    } catch (error) {
      // log("error:${error.toString()}");
      emit(AdErrorState(error: error.toString()));
    }
  }
}
