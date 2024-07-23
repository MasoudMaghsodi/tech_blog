import 'package:get/state_manager.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import '../component/api_constant.dart';
import '../models/article_info_model.dart';
import '../services/dio_service.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> releatedList = RxList();

  @override
  onInit() {
    super.onInit();
    getArticleInfo();
  }

  getArticleInfo() async {
    loading.value = true;
    //TODO user id is hard code
    var userId = '';
    var response = await DioService().getMethod(
        '${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }
    tagList.clear();
    response.data['tags'].forEach((element) {
      tagList.add(TagsModel.fromJson(element));
    });
    // releated.clear();
    response.data['releated'].forEach((element) {
      releatedList.add(ArticleModel.fromJson(element));
    });
  }
}
