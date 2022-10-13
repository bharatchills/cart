import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Model.dart';

class ListModel extends StateNotifier<List<User>> {
  ListModel(List list) : super([]);

  void add(name, noItems, price) {
    state = [...state, User(name, noItems, price)];
  }

  void incremnet(int index) {
    var needEdit = state[index];
    needEdit.noItems++;
  }

  void decrement(int index) {
    var needEdit = state[index];
    needEdit.noItems++;
  }
}

class User {
  final name;
  final price;
  var noItems;
  User(this.name, this.noItems, this.price);
}
