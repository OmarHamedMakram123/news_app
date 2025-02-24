import 'package:json_annotation/json_annotation.dart';

part 'source_response_model.g.dart';

@JsonSerializable()
class SourceResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "sources")
  final List<Sources>? sources;

  SourceResponseModel ({
    this.status,
    this.sources,
  });

  factory SourceResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SourceResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SourceResponseModelToJson(this);
  }
}

@JsonSerializable()
class Sources {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "country")
  final String? country;

  Sources ({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Sources.fromJson(Map<String, dynamic> json) {
    return _$SourcesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SourcesToJson(this);
  }
}


