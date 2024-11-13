import 'package:get/get.dart';
import 'package:ibooks/controller/service/banner_service.dart';
import 'package:ibooks/models/banner_model.dart';

class BannerController extends GetxController {
  final banners = ListBanner(listBanner: []).obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

  void fetchBanner() async {
    isLoading(true);
    final bannersData = await BannerService.fetchBanners();
    if (bannersData != null) {
      banners(bannersData);
    }
    isLoading(false);
  }
}
