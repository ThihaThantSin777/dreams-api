import 'package:dreams_dictionary/data/model/dreams_model.dart';
import 'package:dreams_dictionary/data/vos/blog_details_vo/blog_details_vo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailsProvider = NotifierProvider.family<DetailsPageNotifier, List<BlogDetailsVO>, int>(DetailsPageNotifier.new);

class DetailsPageNotifier extends FamilyNotifier<List<BlogDetailsVO>, int> {
  @override
  List<BlogDetailsVO> build(int arg) {
    return DreamsModel().getDreamDetailsByIDFromDataBase(arg);
  }

  void searchDreamsByWord(String key) {
    if (key.isNotEmpty) {
      state = state.where((element) => element.blogContent.contains(key)).toList();
    } else {
      state = DreamsModel().getDreamDetailsByIDFromDataBase(arg);
    }
  }
}
