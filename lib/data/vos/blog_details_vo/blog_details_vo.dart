import 'package:json_annotation/json_annotation.dart';

part 'blog_details_vo.g.dart';

@JsonSerializable()
class BlogDetailsVO {
  @JsonKey(name: 'BlogDetailId')
  final int blogDetailId;

  @JsonKey(name: 'BlogId')
  final int blogId;

  @JsonKey(name: 'BlogContent')
  final String blogContent;

  BlogDetailsVO(this.blogDetailId, this.blogId, this.blogContent);

  factory BlogDetailsVO.fromJson(Map<String, dynamic> json) => _$BlogDetailsVOFromJson(json);

  Map<String, dynamic> toJson() => _$BlogDetailsVOToJson(this);
}
