import 'package:hive/hive.dart';
part 'source_cached_model.g.dart';
@HiveType(typeId: 1)
class SourceCachedModel {
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String name;

  SourceCachedModel({required this.id, required this.name});



  factory SourceCachedModel.fromJson(Map<String, dynamic> json) {
    return SourceCachedModel(
      id: json['id'],
      name: json['name'],
    );
  }
}