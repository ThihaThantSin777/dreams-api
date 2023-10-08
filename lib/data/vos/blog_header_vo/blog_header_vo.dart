import 'package:json_annotation/json_annotation.dart';

part 'blog_header_vo.g.dart';

@JsonSerializable()
class BlogHeaderVO {
  @JsonKey(name: 'BlogId')
  final int blogId;

  @JsonKey(name: 'BlogTitle')
  String blogTitle;

  String headerKey;

  BlogHeaderVO(this.blogId, this.blogTitle, {this.headerKey = ''});

  factory BlogHeaderVO.fromJson(Map<String, dynamic> json) => _$BlogHeaderVOFromJson(json);

  Map<String, dynamic> toJson() => _$BlogHeaderVOToJson(this);
}
