import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controller/article/manage_article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/route_manager/names.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});

  var articleManageController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: appBar('مدیریت مقاله ها'),
        body: Obx(
          () => articleManageController.loading.value
              ? const Loading()
              : articleManageController.articleList.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: articleManageController.articleList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Get.height / 6,
                                  width: Get.width / 3,
                                  child: CachedNetworkImage(
                                    imageUrl: articleManageController
                                        .articleList[index].image!,
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                    placeholder: (context, url) {
                                      return const Loading();
                                    },
                                    errorWidget: (context, url, error) {
                                      return const Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 50,
                                        color: Colors.grey,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width / 2,
                                      child: Text(
                                        articleManageController
                                            .articleList[index].title!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          articleManageController
                                              .articleList[index].author!,
                                          style: textTheme.labelSmall,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          '${articleManageController.articleList[index].view!} بازدید ',
                                          style: textTheme.labelSmall,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : ArticleEmptyState(textTheme: textTheme),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(
                  Size(Get.width / 3, 56),
                ),
              ),
              onPressed: () {
                Get.toNamed(NamedRoute.singleManageArticle);
              },
              child: const Text(
                "بریم برای نوشتن یک مقاله با حال",
                style: TextStyle(color: solidColors.systemNavigationBarColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ArticleEmptyState extends StatelessWidget {
  const ArticleEmptyState({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.tcbotEmpty.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: MyStrings.articleEmpty,
                style: textTheme.headlineLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
