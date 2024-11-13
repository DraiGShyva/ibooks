import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibooks/components/my_app_button_rounded.dart';
import 'package:ibooks/components/my_app_text.dart';
import 'package:ibooks/controller/app_controller.dart';
import 'package:ibooks/utils/route.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: List.generate(
          _onboardingData.length,
          (index) => _buildPage(
            context,
            _onboardingData[index]['title']!,
            _onboardingData[index]['description']!,
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildPage(BuildContext context, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyAppText(
            title,
            style: MyAppTextStyles.largeBlue.copyWith(fontSize: 30.0),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          MyAppText(description, textAlign: TextAlign.center, maxLines: 5),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPreviousButton(),
          _buildIndicator(),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildPreviousButton() {
    if (_currentPage == 0) {
      return const SizedBox(width: 100.0);
    }
    return MyAppRoundedButton(
      onPressed: () {
        setState(() {
          _currentPage--;
          _pageController.jumpToPage(_currentPage);
        });
      },
      child: const MyAppText('Quay lại'),
    );
  }

  Widget _buildIndicator() {
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          if (_currentPage == i)
            const Icon(Icons.circle, color: Colors.blue)
          else
            const Icon(Icons.circle, color: Colors.grey)
      ],
    );
  }

  Widget _buildNextButton() {
    if (_currentPage == _onboardingData.length - 1) {
      return MyAppRoundedButton(
        onPressed: () {
          final appController = Get.put(AppController());
          appController.isFirstRun.value = false;
          appController.saveFirstRun();
          Navigator.pushNamedAndRemoveUntil(
            context,
            LOGIN,
            (route) => false,
          );
        },
        child: const MyAppText('Bắt đầu'),
      );
    } else {
      return MyAppRoundedButton(
        onPressed: () {
          setState(() {
            _currentPage++;
            _pageController.jumpToPage(_currentPage);
          });
        },
        child: const MyAppText('Tiếp theo'),
      );
    }
  }
}

List<Map<String, String>> _onboardingData = [
  {
    'title': 'Chào mừng bạn\nđến với ứng dụng!',
    'description': 'Khám phá những tính năng tuyệt vời của chúng tôi!'
  },
  {
    'title': 'Tìm kiếm truyện yêu thích\ncủa bạn',
    'description':
        'Tìm kiếm truyện yêu thích của bạn một cách dễ dàng với ứng dụng của chúng tôi!'
  },
  {
    'title': 'Đọc truyện mọi lúc\nmọi nơi',
    'description':
        'Đọc truyện mọi lúc mọi nơi, không giới hạn một cách nhanh chóng và dễ dàng!'
  },
];
