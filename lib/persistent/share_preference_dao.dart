import 'dart:convert';

import 'package:dreams_dictionary/data/vos/blog_details_vo/blog_details_vo.dart';
import 'package:dreams_dictionary/network/response/dreams_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/vos/blog_header_vo/blog_header_vo.dart';

const kKeyForDreams = 'DREAMS';

class SharePreferenceDAO {
  static SharedPreferences? _sharedPreferences;

  static Future<void> createSharePreferenceInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void saveDreamsResponseInDatabase(DreamsResponse dreamsResponse) {
    _sharedPreferences?.setString(kKeyForDreams, jsonEncode(dreamsResponse));
  }

  static List<BlogHeaderVO> get getDreamHeaderFromDataBase {
    final blogResponse = _sharedPreferences?.getString(kKeyForDreams) ?? "";
    DreamsResponse dreamsResponse = DreamsResponse.fromJson(jsonDecode(blogResponse));
    return dreamsResponse.blogHeader;
  }

  static List<BlogDetailsVO> get _getDreamDetailsFromDataBase {
    final blogResponse = _sharedPreferences?.getString(kKeyForDreams) ?? "";
    DreamsResponse dreamsResponse = DreamsResponse.fromJson(jsonDecode(blogResponse));
    return dreamsResponse.blogDetails;
  }

  static List<BlogDetailsVO> getDreamDetailsByKeywordFromDataBase(String key) {
    return _getDreamDetailsFromDataBase.where((element) => element.blogContent.contains(key)).toList();
  }

  static List<BlogDetailsVO> getDreamDetailsByIDFromDataBase(int id) {
    final blogResponse = _sharedPreferences?.getString(kKeyForDreams) ?? "";
    DreamsResponse dreamsResponse = DreamsResponse.fromJson(jsonDecode(blogResponse));
    return dreamsResponse.blogDetails.where((element) => element.blogId == id).toList();
  }
}
