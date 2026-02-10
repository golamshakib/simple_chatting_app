import 'package:get/get.dart';
import 'package:simple_chatting_app/features/login/presentation/screen/login_screen.dart';
import '../features/chat/presentation/screen/chatting_list.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {
  static String init = "/";
  static String loginScreen = "/loginScreen";
  static String chattingListScreen = "/chattingListScreen";



  static List<GetPage> routes = [
    GetPage(name: init, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: chattingListScreen, page: () => const ChattingListScreen()),
  ];
}