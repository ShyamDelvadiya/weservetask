import 'package:get/get.dart';
import 'package:untitled2/util/image_constants.dart';

class FlowerController extends GetxController {
  final List<String> flowersList = [
    ImageConstants.flower1,
    ImageConstants.flower2,
    ImageConstants.flower3,
    ImageConstants.flower4,
    ImageConstants.flower5,
    ImageConstants.flower6,
    ImageConstants.flower7
  ];
  var shuffeldList = <String>[
    ImageConstants.flower4,
    ImageConstants.flower5,
    ImageConstants.flower6,
    ImageConstants.flower7
  ].obs;

  generateFlowers() {
    List<String> remainingFlowers =
        flowersList.toSet().difference(shuffeldList.toSet()).toList();
    if (remainingFlowers.length < 4) {
      remainingFlowers = flowersList.toList();
    }
    remainingFlowers.shuffle();
    shuffeldList.value = remainingFlowers.take(4).toList();
  }
}
