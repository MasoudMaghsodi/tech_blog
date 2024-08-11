import 'package:get/get.dart';
import 'package:tech_blog/controller/list_article_controller.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/controller/single_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(() => ListArticleController());
    Get.lazyPut(() => SingleArticleController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(RegisterController());
  }
}
