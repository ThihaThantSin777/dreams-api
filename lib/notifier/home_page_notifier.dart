import 'package:dreams_dictionary/data/model/dreams_model.dart';
import 'package:dreams_dictionary/network/response/dreams_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = FutureProvider<DreamsResponse?>((ref) async => DreamsModel().fetchDreamAPI());
