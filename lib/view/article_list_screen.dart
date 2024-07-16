import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controller/article_controller.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar("مقالات جدید"),
        body: Obx(
          () => ListView.builder(
            itemCount: articleController.articleList.length,
            itemBuilder: (context, index) {
              return Text(articleController.articleList[index].title!);
            },
          ),
        ),
      ),
    );
  }
}
