// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_details_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogDetailsVO _$BlogDetailsVOFromJson(Map<String, dynamic> json) =>
    BlogDetailsVO(
      json['BlogDetailId'] as int,
      json['BlogId'] as int,
      json['BlogContent'] as String,
    );

Map<String, dynamic> _$BlogDetailsVOToJson(BlogDetailsVO instance) =>
    <String, dynamic>{
      'BlogDetailId': instance.blogDetailId,
      'BlogId': instance.blogId,
      'BlogContent': instance.blogContent,
    };
