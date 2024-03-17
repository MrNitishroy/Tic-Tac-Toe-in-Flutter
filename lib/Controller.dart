import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class Controller extends GetxController {
  RxList<String> gameValue = ["", "", "", "", "", "", "", "", ""].obs;

  RxBool isWinner = false.obs;
  RxBool isX = false.obs;
  RxInt click = 0.obs;
  void addValue(int index) {
    if (gameValue[index] == "") {
      if (isX.value) {
        gameValue[index] = "X";
        isX.value = !isX.value;
        click++;
      } else {
        gameValue[index] = "O";
        isX.value = !isX.value;
        click++;
      }
    } else {
      print("Invalid click");
    }

    checkWinner();
    if (isWinner.value == false) {
      matchDrawMessage(click);
    }
  }

  void matchDrawMessage(click) {
    if (click == 9) {
      Get.defaultDialog(
        title: "Match Draw",
        cancel: Text("Cancle"),
        confirm: TextButton(
          onPressed: () {
            gameValue.value = ["", "", "", "", "", "", "", "", ""];
            click.value = 0;
            Get.back();
          },
          child: Text("PlayAgain"),
        ),
      );
    }
  }

  void checkWinner() {
    if (gameValue[0] == gameValue[1] &&
        gameValue[0] == gameValue[2] &&
        gameValue[0] != "") {
      WinnerDialogBox();
    } else if (gameValue[3] == gameValue[4] &&
        gameValue[3] == gameValue[5] &&
        gameValue[3] != "") {
      WinnerDialogBox();
    } else if (gameValue[6] == gameValue[7] &&
        gameValue[6] == gameValue[8] &&
        gameValue[6] != "") {
      WinnerDialogBox();
    }
    // Horzontal
    else if (gameValue[0] == gameValue[3] &&
        gameValue[0] == gameValue[6] &&
        gameValue[0] != "") {
      WinnerDialogBox();
    } else if (gameValue[1] == gameValue[4] &&
        gameValue[1] == gameValue[7] &&
        gameValue[1] != "") {
      WinnerDialogBox();
    } else if (gameValue[2] == gameValue[5] &&
        gameValue[2] == gameValue[8] &&
        gameValue[2] != "") {
      WinnerDialogBox();

      // digobalss
    } else if (gameValue[0] == gameValue[4] &&
        gameValue[0] == gameValue[8] &&
        gameValue[0] != "") {
      WinnerDialogBox();
    } else if (gameValue[2] == gameValue[4] &&
        gameValue[2] == gameValue[6] &&
        gameValue[2] != "") {
      WinnerDialogBox();
    } else {}
  }

  void WinnerDialogBox() {
    isWinner.value = true;
    Get.defaultDialog(
        title: "🥇 Winner 🥇",
        content: Column(
          children: [
            const Icon(
              Icons.confirmation_num_rounded,
              size: 50,
              color: Colors.green,
            ),
            SizedBox(height: 10),
            isX.value
                ? const Text(
                    "X Is Winner",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                : const Text(
                    "O Is Winner",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                  label: Text("Close"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    gameValue.value = ["", "", "", "", "", "", "", "", ""];
                    click.value = 0;
                    isWinner.value = false;
                    Get.back();
                  },
                  icon: Icon(Icons.play_arrow),
                  label: Text("Play Again"),
                ),
              ],
            )
          ],
        ));
  }
}
