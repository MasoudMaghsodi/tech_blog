import 'package:get/get.dart';
import 'package:tech_blog/route_manager/names.dart';
import 'package:tech_blog/view/articles/manage_article.dart';
import 'package:tech_blog/view/articles/single.dart';
import 'package:tech_blog/view/articles/single_manage_article.dart';
import 'package:tech_blog/view/main_screen/main_screen.dart';
import 'package:tech_blog/view/podcast/single_podcast.dart';
import 'package:tech_blog/view/splash_screen.dart';
import 'binding.dart';

class Pages {
  Pages._();

  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: NamedRoute.initialRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: NamedRoute.routeMainScreen,
      page: () => MainScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: NamedRoute.routeSingleArticle,
      page: () => Single(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: NamedRoute.manageArticle,
      page: () => ManageArticle(),
      binding: ArticleManagerBinding(),
    ),
    GetPage(
      name: NamedRoute.singleManageArticle,
      page: () => SingleManageArticle(),
      binding: ArticleManagerBinding(),
    ),
    GetPage(
      name: NamedRoute.singlePodcast,
      page: () => SinglePodcast(),
    ),
  ];
}
