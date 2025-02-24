import 'package:hive/hive.dart';
part 'news_cached_model.g.dart';
@HiveType(typeId: 2)
class NewsCachedModel {
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String author;
  @HiveField(4)
  final String url;
  @HiveField(5)
  final String urlToImage;
  @HiveField(6)
  final String publishedAt;
  @HiveField(7)
  final String content;
  @HiveField(8)
  final String sourceName;
  NewsCachedModel({required this.sourceName, required this.title, required this.description, required this.author, required this.url, required this.urlToImage, required this.publishedAt, required this.content});

}