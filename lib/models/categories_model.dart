class CategoriModel {
  String? id;
  String? title;

  CategoriModel({
    required this.id,
    required this.title,
  });

  CategoriModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
  }
}
