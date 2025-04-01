import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';
import 'package:think_of_a_number/app/services/ad_service.dart';
import 'package:think_of_a_number/app_config.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  BannerAd? _bannerAd;
  final adService = Get.find<AdService>();

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  Future<void> _loadAd() async {
    if (isAdsEnabled) {
      final newAd = await adService.createNewBannerAd();
      if (mounted) {
        setState(() {
          _bannerAd = newAd;
        });
      }
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isAdsEnabled) {
      return const SizedBox.shrink(); // Return an empty widget if ads are disabled
    }

    return Container(
      color: Colors.grey[850],
      alignment: Alignment.center,
      width: _bannerAd?.size.width.toDouble() ?? 320.w,
      height: _bannerAd?.size.height.toDouble() ?? 50.h,
      child: Obx(() {
        if (adService.isAdLoaded.value && _bannerAd != null) {
          return Container(color: Colors.grey[850], child: AdWidget(ad: _bannerAd!));
        }
        return Container(
          color: Colors.grey[850],
          alignment: Alignment.center,
          child: Text('Ad Loading...', style: TextStyle(fontSize: 14.sp, color: Colors.white)),
        );
      }),
    );
  }
}
