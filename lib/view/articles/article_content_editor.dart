import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controller/article/manage_article_controller.dart';

// ignore: must_be_immutable
class ArticleContentEditor extends StatelessWidget {
  ArticleContentEditor({super.key});

  final HtmlEditorController controller = HtmlEditorController();
  var manageArticleController = Get.put(ManageArticleController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: appBar("نوشتن / ویرایش مقاله "),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: "میتونی مقاله ات رو اینجا بنویسی ...",
                  shouldEnsureVisible: true,
                  initialText:
                      manageArticleController.articleInfoModel.value.content,
                ),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    manageArticleController.articleInfoModel.value.content = p0;
                    log(
                      manageArticleController.articleInfoModel.value.content
                          .toString(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
