// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceResponseModel _$SourceResponseModelFromJson(Map<String, dynamic> json) =>
    SourceResponseModel(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Sources.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SourceResponseModelToJson(
        SourceResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sources': instance.sources,
    };

Sources _$SourcesFromJson(Map<String, dynamic> json) => Sources(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      category: json['category'] as String?,
      language: json['language'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
    };
