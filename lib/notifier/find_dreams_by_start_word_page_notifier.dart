import 'package:dreams_dictionary/data/model/dreams_model.dart';
import 'package:dreams_dictionary/data/vos/blog_header_vo/blog_header_vo.dart';
import 'package:dreams_dictionary/network/response/dreams_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogHeaderProvider = NotifierProvider<FindDreamsByStartWordNotifier, List<BlogHeaderVO>>(FindDreamsByStartWordNotifier.new);

class FindDreamsByStartWordNotifier extends Notifier<List<BlogHeaderVO>> {
  final DreamsModel _dreamsModel = DreamsModel();

  @override
  List<BlogHeaderVO> build() {
    var blogHeaderVOList = _dreamsModel.getBlogHeaderListFromDatabase;
    blogHeaderVOList = blogHeaderVOList.map((e) {
      final split = e.blogTitle.split(']');
      final firstWord = split.first.replaceAll('[', '').trim();
      final secondWord = split.last.trim();
      e.headerKey = firstWord;
      e.blogTitle = secondWord;
      return e;
    }).toList();
    return blogHeaderVOList;
  }
}
