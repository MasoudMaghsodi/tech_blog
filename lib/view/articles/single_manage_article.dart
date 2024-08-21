import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/dimens.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controller/article/manage_article_controller.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/services/pick_file.dart';
import 'package:tech_blog/view/articles/article_content_editor.dart';
import '../../controller/file_controller.dart';
import '../../gen/assets.gen.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  SingleManageArticle({super.key});

  var manageArticleCotroller = Get.find<ManageArticleController>();
  FilePickerController filePickerController = Get.put(FilePickerController());
  getTitle() {
    Get.defaultDialog(
      title: "عنوان مقاله",
      content: TextField(
        controller: manageArticleCotroller.titleTextEditingController,
        keyboardType: TextInputType.text,
        style: const TextStyle(
          color: solidColors.colorTitle,
        ),
        decoration: const InputDecoration(
          hintText: 'اینجا بنویس',
        ),
      ),
      backgroundColor: solidColors.primeryColor,
      titleStyle: const TextStyle(
        color: solidColors.statusBarColor,
      ),
      radius: 8,
      confirm: ElevatedButton(
        onPressed: () {
          manageArticleCotroller.updateTitle();
          Get.back();
        },
        child: const Text('ثبت'),
      ),
    );
  }

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
                    SizedBox(
                      width: Get.width,
                      height: Get.height / 3,
                      child: filePickerController.file.value.name == 'nothing'
                          ? CachedNetworkImage(
                              imageUrl: manageArticleCotroller
                                  .articleInfoModel.value.image!,
                              imageBuilder: (context, imageProvider) =>
                                  Image(image: imageProvider),
                              placeholder: (context, url) => const Loading(),
                              errorWidget: (context, url, error) => Image.asset(
                                Assets.images.singlePlaceHolder.path,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.file(
                              File(
                                filePickerController.file.value.path!,
                              ),
                              fit: BoxFit.cover,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(),
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
                        child: GestureDetector(
                          onTap: () {
                            pickFile();
                          },
                          child: Container(
                            height: 30,
                            width: Get.width / 3,
                            decoration: const BoxDecoration(
                              color: solidColors.primeryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'انتخاب تصویر',
                                  style: textTheme.displayMedium,
                                ),
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    getTitle();
                  },
                  child: SeeMoreBlog(
                    bodyMargin: Dimens.halfBodyMargin,
                    textTheme: textTheme,
                    title: "ویرایش عنوان مقاله",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimens.halfBodyMargin),
                  child: Text(
                    manageArticleCotroller.articleInfoModel.value.title!,
                    maxLines: 2,
                    style: textTheme.headlineLarge,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(() => ArticleContentEditor()),
                  child: SeeMoreBlog(
                    bodyMargin: Dimens.halfBodyMargin,
                    textTheme: textTheme,
                    title: "ویرایش متن اصلی مقاله",
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
                GestureDetector(
                  onTap: () {
                    chooseCatsBottomSheet(textTheme);
                  },
                  child: SeeMoreBlog(
                    bodyMargin: Dimens.halfBodyMargin,
                    textTheme: textTheme,
                    title: "انتخاب دسته بندی",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimens.halfBodyMargin),
                  child: Text(
                    manageArticleCotroller.articleInfoModel.value.catName ==
                            null
                        ? "هیچ دسته بندی انتخاب نشده "
                        : manageArticleCotroller
                            .articleInfoModel.value.catName!,
                    maxLines: 2,
                    style: textTheme.headlineLarge,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async =>
                      await manageArticleCotroller.storeArticle(),
                  child: Text(
                    manageArticleCotroller.loading.value
                        ? "صبر کنید ..."
                        : 'ارسال مطلب',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
                // tags(textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cats(textTheme) {
    var homeScreenController = Get.find<HomeScreenController>();
    return SizedBox(
      height: Get.height / 1.7,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: homeScreenController.tagList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              manageArticleCotroller.articleInfoModel.update((val) {
                val?.catId = homeScreenController.tagList[index].id!;
                val?.catName = homeScreenController.tagList[index].title!;
              });
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 15, 8),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: solidColors.primeryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          homeScreenController.tagList[index].title!,
                          style: textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }

  chooseCatsBottomSheet(TextTheme textTheme) {
    Get.bottomSheet(
      Container(
        height: Get.height / 1.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('انتخاب دسته بندی'),
              const SizedBox(
                height: 8,
              ),
              cats(textTheme),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      persistent: true,
    );
  }
}
