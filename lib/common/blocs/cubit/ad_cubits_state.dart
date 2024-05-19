part of 'ad_cubits_cubit.dart';

abstract class AdCubitsState {}

final class AdInitialState extends AdCubitsState {}

final class AdLoadingState extends AdCubitsState {}

final class BannerAdLoadedState extends AdCubitsState {
  final BannerAd bannerAd;

  BannerAdLoadedState({required this.bannerAd});
}

final class InterstitialAdLoadedState extends AdCubitsState {
  final InterstitialAd fullPageAd;

  InterstitialAdLoadedState({required this.fullPageAd});
}

final class AdErrorState extends AdCubitsState {
  final String error;

  AdErrorState({required this.error});
}
