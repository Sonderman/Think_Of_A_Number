import 'dart:io'; // Required for Platform check
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// A reusable widget to display a banner ad.
// It handles loading the ad and displaying it in a container.
class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  final String _adUnitId =
      Platform.isAndroid
          ? 'ca-app-pub-8398366046575199/4214927857'
          : 'ca-app-pub-3940256099942544/2934735716'; // iOS Test ID

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  /// Loads the banner ad.
  void _loadAd() {
    _bannerAd = BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: AdSize.banner, // Standard banner size
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isAdLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad to free resources.
          ad.dispose();
          _bannerAd = null; // Ensure we don't try to use a failed ad
          setState(() {
            _isAdLoaded = false;
          });
          // Optionally retry loading after a delay
          // Future.delayed(const Duration(seconds: 30), () => _loadAd());
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => debugPrint('$ad onAdOpened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => debugPrint('$ad onAdClosed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) => debugPrint('$ad onAdImpression.'),
      ),
    )..load(); // Start loading the ad
  }

  @override
  void dispose() {
    // Dispose the banner ad when the widget is removed from the widget tree.
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use a container with specific dimensions that match the ad size.
    // ScreenUtil helps make these dimensions responsive if needed,
    // though standard banner sizes are often fixed pixel values.
    // AdSize.banner is typically 320x50.
    return Container(
      alignment: Alignment.center,
      width: _bannerAd?.size.width.toDouble() ?? 320.w, // Use ad size or default
      height: _bannerAd?.size.height.toDouble() ?? 50.h, // Use ad size or default
      child:
          _isAdLoaded && _bannerAd != null
              ? AdWidget(ad: _bannerAd!) // Display the loaded ad
              : Container(
                // Placeholder while loading or if failed
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: Text(
                  'Ad Loading...',
                  style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                ),
              ),
    );
  }
}
