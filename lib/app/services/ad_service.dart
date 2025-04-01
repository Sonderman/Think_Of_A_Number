import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';
import 'package:think_of_a_number/app_config.dart';

/// Service that manages banner ads lifecycle
class AdService extends GetxService {
  BannerAd? _currentAd;
  final RxBool _isAdLoaded = false.obs;
  final String _adUnitId = Platform.isAndroid ? androidAdUnitId : iosAdUnitId;

  /// Create and load a new banner ad
  Future<BannerAd?> createNewBannerAd() async {
    // Check if ads are enabled
    if (!isAdsEnabled) {
      debugPrint('Ads are disabled in app_config.dart');
      return null;
    }

    // Dispose previous ad if exists
    _currentAd?.dispose();

    final bannerAd = BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('BannerAd loaded.');
          _currentAd = ad as BannerAd;
          _isAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
          _isAdLoaded.value = false;
        },
        onAdOpened: (Ad ad) => debugPrint('$ad onAdOpened.'),
        onAdClosed: (Ad ad) => debugPrint('$ad onAdClosed.'),
        onAdImpression: (Ad ad) => debugPrint('$ad onAdImpression.'),
      ),
    );

    await bannerAd.load();
    return bannerAd;
  }

  /// Initialize first banner ad
  Future<AdService> initBannerAd() async {
    if (isAdsEnabled) {
      await createNewBannerAd();
    }
    return this;
  }

  /// Get the current banner ad
  BannerAd? get bannerAd => _currentAd;

  /// Check if ad is loaded
  RxBool get isAdLoaded => _isAdLoaded;

  @override
  void onClose() {
    _currentAd?.dispose();
    super.onClose();
  }
}
