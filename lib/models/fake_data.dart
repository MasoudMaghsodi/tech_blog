import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/data_models.dart';

Map homePagePoster = {
  "imageAsset": Assets.images.posterTest.path,
  "writer": "ملیکا عزیزی",
  "date": "یک روز پیش",
  "title": "دوازدهم قدم برنامه نویسی یک دوره",
  "view": "251",
};

// blog fake data

List<HashTagModel> tagList = [
  HashTagModel(title: "جاوا"),
  HashTagModel(title: "کاتلین"),
  HashTagModel(title: "وب"),
  HashTagModel(title: "هوش مصنوعی"),
  HashTagModel(title: "iot"),
  HashTagModel(title: "دارت"),
];
List<HashTagModel> selectedTags = [];
