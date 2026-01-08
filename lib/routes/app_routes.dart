import 'package:get/get.dart';
import 'package:simple_chatting_app/features/chatting_list/presentation/screen/chatting_list.dart';

import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {
  static String init = "/";
  static String chattingListScreen = "/chattingListScreen";



  static List<GetPage> routes = [
    GetPage(name: init, page: () => const SplashScreen()),
    GetPage(name: chattingListScreen, page: () => const ChattingListScreen()),
  ];
}