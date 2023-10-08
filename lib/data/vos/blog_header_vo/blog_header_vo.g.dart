// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_header_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogHeaderVO _$BlogHeaderVOFromJson(Map<String, dynamic> json) => BlogHeaderVO(
      json['BlogId'] as int,
      json['BlogTitle'] as String,
    );

Map<String, dynamic> _$BlogHeaderVOToJson(BlogHeaderVO instance) =>
    <String, dynamic>{
      'BlogId': instance.blogId,
      'BlogTitle': instance.blogTitle,
    };
