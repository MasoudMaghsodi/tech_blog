import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
// import 'package:tech_blog/component/storage_const.dart';
import 'package:tech_blog/services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxBool loading = false.obs;
  RxList<TagsModel> tagList = RxList.empty();

  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
          'اینجا عنوان مقاله قرار میگیره پس یه عنوان جذاب انتخاب کن',
          """ من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی
 """,
          '')
      .obs;
  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    loading.value = true;
    var response =
        await DioService().getMethod('${ApiConstant.publishedByMe}1');
    // var response = await DioService().getMethod(
    //     ApiConstant.publishedByMe + GetStorage().read(StorageKey.userId));

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
