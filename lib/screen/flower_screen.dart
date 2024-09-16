import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controller/flower_controller.dart';
import 'package:untitled2/util/common_button/common_button.dart';
import 'package:untitled2/util/image_constants.dart';

class FlowerScreen extends StatefulWidget {
  const FlowerScreen({super.key});

  @override
  State<FlowerScreen> createState() => _FlowerScreenState();
}

class _FlowerScreenState extends State<FlowerScreen> {
  final FlowerController controller = Get.find();
  List<String> shuffleFlowers = [];

  // _generateRandomFlowers() {
  //   setState(() {
  //     flowersList.shuffle();
  //
  //     shuffleFlowers;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: _body(context),
    );
  }

  _appbar(BuildContext context) {
    return AppBar();
  }

  _body(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      int crossAxisCount = orientation == Orientation.portrait ? 2 : 4;
      return Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: crossAxisCount,
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: crossAxisCount),
              children: List.generate(4, (index) {
                return Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: Image.asset(
                        controller.shuffeldList[index],
                        fit: BoxFit.contain,
                        height: Get.height,
                        width: Get.width,
                      ),
                    ),
                  );
                });
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonButton(
                color: Colors.redAccent,
                onPressed: () {
                  controller.generateFlowers();
                },
                text: 'Shuffle'),
          ),
        ],
      );
    });
  }
}
