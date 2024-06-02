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

List<BlogModel> blogList = [
  BlogModel(
    id: 16,
    imageUrl: Assets.images.test.path,
    title: ' test1 ',
    writer: 'test',
    writerImageUrl: 'test ',
    date: ' test',
    content: '''
testtesttesttesttesttesttesttesttesttesttesttest
      ''',
    views: '256',
  ),
  BlogModel(
    id: 16,
    imageUrl: Assets.images.test.path.toString(),
    title: ' test2 ',
    writer: 'test ',
    writerImageUrl: ' test',
    date: ' test',
    content: '''
testtesttesttesttesttesttesttesttesttesttesttest
      ''',
    views: '256',
  ),
  BlogModel(
    id: 16,
    imageUrl: Assets.images.test.path.toString(),
    title: ' test3 ',
    writer: ' test',
    writerImageUrl: 'test ',
    date: ' test',
    content: '''
testtesttesttesttesttesttesttesttesttesttesttest
      ''',
    views: '256',
  ),
  BlogModel(
    id: 16,
    imageUrl: Assets.images.test.path.toString(),
    title: ' test4 ',
    writer: ' test',
    writerImageUrl: 'test ',
    date: ' test',
    content: '''
testtesttesttesttesttesttesttesttesttesttesttest
      ''',
    views: '256',
  ),
  BlogModel(
    id: 16,
    imageUrl: Assets.images.test.path.toString(),
    title: ' test5 ',
    writer: ' test',
    writerImageUrl: 'test ',
    date: 'test ',
    content: '''
testtesttesttesttesttesttesttesttesttesttesttest
      ''',
    views: '256',
  ),
  BlogModel(
    id: 16,
    imageUrl: Assets.images.splash.path.toString(),
    title: ' test6 ',
    writer: ' test',
    writerImageUrl: 'test',
    date: ' test',
    content: '''
testtesttesttesttesttesttesttesttesttesttesttest
      ''',
    views: '256',
  ),
  BlogModel(
    id: 16,
    imageUrl: Assets.images.splash.path.toString(),
    title: ' test7 ',
    writer: 'test ',
    writerImageUrl: 'test ',
    date: ' test',
    content: '''
testtesttesttesttesttesttesttesttesttesttesttest
      ''',
    views: '256',
  ),
];
