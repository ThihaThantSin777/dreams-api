import 'package:dreams_dictionary/data/vos/blog_details_vo/blog_details_vo.dart';
import 'package:dreams_dictionary/data/vos/blog_header_vo/blog_header_vo.dart';
import 'package:dreams_dictionary/network/api/api_service.dart';
import 'package:dreams_dictionary/persistent/share_preference_dao.dart';

import '../../network/response/dreams_response.dart';

class DreamsModel {
  DreamsModel._();

  static final DreamsModel _singleton = DreamsModel._();

  factory DreamsModel() => _singleton;

  Future<DreamsResponse?> fetchDreamAPI() => ApiService().getDreamsContent().then((value) {
        if (value != null) {
          SharePreferenceDAO.saveDreamsResponseInDatabase(value);
        }
        return value;
      });

  List<BlogHeaderVO> get getBlogHeaderListFromDatabase => SharePreferenceDAO.getDreamHeaderFromDataBase;

  List<BlogDetailsVO> getDreamDetailsByKeywordFromDataBase(String key) => SharePreferenceDAO.getDreamDetailsByKeywordFromDataBase(key);

  List<BlogDetailsVO> getDreamDetailsByIDFromDataBase(int id) => SharePreferenceDAO.getDreamDetailsByIDFromDataBase(id);
}
