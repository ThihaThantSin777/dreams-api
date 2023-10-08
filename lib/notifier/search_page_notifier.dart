import 'package:dreams_dictionary/data/vos/blog_details_vo/blog_details_vo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/dreams_model.dart';

class SearchPageNotifier extends Notifier<List<BlogDetailsVO>> {
  @override
  List<BlogDetailsVO> build() => [];

  void searchDreamsByWord(String key) {
    if (key.isNotEmpty) {
      state = DreamsModel().getDreamDetailsByKeywordFromDataBase(key);
    } else {
      state = [];
    }
  }
}

final searchBlogContentList = NotifierProvider<SearchPageNotifier, List<BlogDetailsVO>>(() => SearchPageNotifier());
