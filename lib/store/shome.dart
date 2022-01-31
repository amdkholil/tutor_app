import 'dart:ffi';
import 'package:mobx/mobx.dart';

part 'shome.g.dart';

class SHome = SHomeBase with _$SHome;

abstract class SHomeBase with Store {
  @observable
  bool isLogin = false;
}
