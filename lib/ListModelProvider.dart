import 'package:cart/ListModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listModelProvider = StateNotifierProvider((ref) {
  return ListModel([
    User("name", 0, "1000"),
    User("Bharat", 0, "2000"),
    User("Sudheer", 0, "3000")
  ]);
});
