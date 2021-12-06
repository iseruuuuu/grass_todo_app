import 'dart:async';
import 'package:get/get.dart';
import 'dart:math' as math;

class HomeScreenController extends GetxController {
  StreamController<int> streamController = StreamController<int>();
  final item = 0.obs;
  final random = math.Random();
  final resultText = 'aaasss'.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
