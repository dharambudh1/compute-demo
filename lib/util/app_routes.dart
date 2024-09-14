import "package:compute_demo/binding/home_binding.dart";
import "package:compute_demo/screen/home_screen.dart";
import "package:get/get.dart";

class AppRoutes {
  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal();

  static final AppRoutes _singleton = AppRoutes._internal();

  String get homeScreen => "/";

  List<GetPage<dynamic>> get getPages {
    final GetPage<dynamic> getPages = GetPage<dynamic>(
      name: homeScreen,
      page: HomeScreen.new,
      binding: HomeBinding(),
    );
    return <GetPage<dynamic>>[getPages];
  }
}
