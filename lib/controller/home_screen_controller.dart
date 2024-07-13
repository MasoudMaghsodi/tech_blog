import 'package:get/state_manager.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;

  RxList tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PosterModel> topPodcasts = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
    }
  }
}
