import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controller/article/list_article_controller.dart';
import 'package:tech_blog/controller/article/manage_article_controller.dart';
import 'package:tech_blog/view/articles/article_list_screen.dart';
import '../../gen/assets.gen.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  SingleManageArticle({super.key});

  var manageArticleCotroller = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          manageArticleCotroller.articleInfoModel.value.image!,
                      imageBuilder: (context, imageProvider) =>
                          Image(image: imageProvider),
                      placeholder: (context, url) => const Loading(),
                      errorWidget: (context, url, error) => Image.asset(
                        Assets.images.singlePlaceHolder.path,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: gradiantColors.singleAppbarGradient,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24,
                            ),
                            Expanded(child: SizedBox()),
                            Icon(
                              Icons.bookmark_border_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 30,
                            width: 60,
                            color: Colors.amberAccent,
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    manageArticleCotroller.articleInfoModel.value.title!,
                    maxLines: 2,
                    style: textTheme.headlineLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image(
                        image: Image.asset(Assets.images.avatar.path).image,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HtmlWidget(
                    manageArticleCotroller.articleInfoModel.value.content!,
                    textStyle: textTheme.labelLarge,
                    enableCaching: true,
                    onLoadingBuilder: (context, element, loadingProgress) =>
                        const Loading(),
                  ),
                ),
                // tags(textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tags(textTheme) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: manageArticleCotroller.tagList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              var tagId = manageArticleCotroller.tagList[index].id!;
              String tagName = manageArticleCotroller.tagList[index].title!;
              await Get.find<ListArticleController>()
                  .getArticleListWithTagsId(tagId);

              Get.to(ArticleListScreen(
                title: tagName,
              ));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 15, 8),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        manageArticleCotroller.tagList[index].title!,
                        style: textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
