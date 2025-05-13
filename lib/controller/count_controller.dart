import 'package:get/get.dart';

class CountController {
  Rx<int> count = Rx(0);
  void increment(){
    count.value++;
  }
}