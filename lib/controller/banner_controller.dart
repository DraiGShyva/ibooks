import 'package:get/get.dart';
import 'package:myapp/models/banner_model.dart';

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
    print(bannersData);
    // ignore: unnecessary_null_comparison
    if (bannersData != null) {
      banners(bannersData);
    }
    isLoading(false);
  }
}

class BannerService {
  static Future<ListBanner?> fetchBanners() async {
    ListBanner? banners = ListBanner.fromJson(_bannerJson);
    return banners;
  }

  static final _bannerJson = [
    {
      "image": "assets/images/banners/1Mz0O54RzA0rd9rk6yzoLMZCG7j6Sfh1q.jpg",
      "id": "tai-thiet-ham-nguc"
    },
    {
      "image": "assets/images/banners/1iq7aHWEdlAysDFP1Nul3TdQQNQq518Cj.jpg",
      "id": "dao-hai-tac"
    },
    {
      "image": "assets/images/banners/1jIZYRfOhND23Ztbw3n4bzGz9TFaJJax2.jpg",
      "id": "onepunch-man"
    },
    {
      "image": "assets/images/banners/1MP6UdYiZZYDE4AEDsbnoFJKrbnkghsWN.jpg",
      "id": "hoa-than-thanh-meo"
    },
    {
      "image": "assets/images/banners/1_gbu3O1VVd9jsLMdumsWHWmHKBjs2mJr.jpg",
      "id": "trieu-hoi-den-the-gioi-fantasy"
    },
    {
      "image": "assets/images/banners/1DVNZQ_j_uIEI22jWDT6NUwdL8wbI5Xak.jpg",
      "id": "thang-cap-vo-han-trong-murim"
    },
    {
      "image": "assets/images/banners/15C0fR2A1gvtrbPSWvjK84vhvVgpWXB6e.jpg",
      "id": "cuoc-chien-trong-toa-thap"
    }
  ];
}
