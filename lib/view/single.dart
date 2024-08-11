import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controller/list_article_controller.dart';
import 'package:tech_blog/controller/single_article_controller.dart';
import 'package:tech_blog/view/article_list_screen.dart';
import '../gen/assets.gen.dart';

// ignore: must_be_immutable
class Single extends StatelessWidget {
  Single({super.key});

  var singleArticleController = Get.find<SingleArticleController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => singleArticleController.articleInfoModel.value.image == null
                ? SizedBox(
                    height: Get.height,
                    child: const Loading(),
                  )
                : Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: singleArticleController
                                .articleInfoModel.value.image!,
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
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          singleArticleController.articleInfoModel.value.title!,
                          maxLines: 2,
                          style: textTheme.headlineLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image(
                              image:
                                  Image.asset(Assets.images.avatar.path).image,
                              height: 50,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              singleArticleController
                                  .articleInfoModel.value.author!,
                              style: textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              singleArticleController
                                  .articleInfoModel.value.createdAt!,
                              style: textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HtmlWidget(
                          singleArticleController
                              .articleInfoModel.value.content!,
                          textStyle: textTheme.labelLarge,
                          enableCaching: true,
                          onLoadingBuilder:
                              (context, element, loadingProgress) =>
                                  const Loading(),
                        ),
                      ),
                      tags(textTheme),
                      const SizedBox(
                        height: 20,
                      ),
                      simillar(textTheme),
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
        itemCount: singleArticleController.tagList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              var tagId = singleArticleController.tagList[index].id!;
              String tagName = singleArticleController.tagList[index].title!;
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
                        singleArticleController.tagList[index].title!,
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

  Widget simillar(textTheme) {
    return SizedBox(
      height: Get.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: singleArticleController.relatedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                singleArticleController.getArticleInfo(
                    singleArticleController.relatedList[index].id!);
              },
              child: Padding(
                padding:
                    EdgeInsets.only(right: index == 0 ? Get.width / 15 : 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: Get.height / 5.3,
                        width: Get.height / 2.4,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: singleArticleController
                                  .relatedList[index].image!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => const Loading(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    singleArticleController
                                        .relatedList[index].author!,
                                    style: textTheme.titleLarge,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        singleArticleController
                                            .relatedList[index].view!,
                                        style: textTheme.titleLarge,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 2.4,
                      child: Text(
                        singleArticleController.relatedList[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
