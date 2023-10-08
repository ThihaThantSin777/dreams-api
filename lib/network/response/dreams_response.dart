import 'package:dreams_dictionary/data/vos/blog_details_vo/blog_details_vo.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/blog_header_vo/blog_header_vo.dart';

part 'dreams_response.g.dart';

@JsonSerializable()
class DreamsResponse {
  @JsonKey(name: 'BlogHeader')
  List<BlogHeaderVO> blogHeader;

  @JsonKey(name: 'BlogDetail')
  List<BlogDetailsVO> blogDetails;

  DreamsResponse(this.blogHeader, this.blogDetails);

  factory DreamsResponse.fromJson(Map<String, dynamic> json) => _$DreamsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DreamsResponseToJson(this);
}
