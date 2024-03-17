import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tectaktoe/Controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    decoration: BoxDecoration(
                      color: controller.isX.value == false
                          ? Colors.blue
                          : Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "O",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    decoration: BoxDecoration(
                      color: controller.isX.value == false
                          ? Colors.grey[800]
                          : Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "X",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Expanded(
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        print(index);
                        controller.addValue(index);
                      },
                      child: Obx(
                        () => Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              controller.gameValue.value[index],
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ));
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
