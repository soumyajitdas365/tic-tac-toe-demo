import 'package:flutter/material.dart';

import 'package:tic_tac_toe/Screens/index.dart';

import 'package:tic_tac_toe/Utils/constants/index.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> symbols = ['X', 'O'];
  int currentSymbolIndex = 0;
  List<String?> gridValues = List.filled(9, null);

  @override
  Widget build(BuildContext context) {
    double widthP = Dimensions.myWidthThis(context);
    double heightF = Dimensions.myHeightFThis(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Connect 3 Game",
            style: TextStyle(color: white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 10 * widthP, vertical: 100 * heightF),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      resetGame();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      backgroundColor: purple,
                      minimumSize: Size(double.infinity, 50 * heightF),
                    ),
                    child: Text(
                      "Play Again",
                      style: TextStyle(
                        color: white,
                        fontSize: 20 * heightF,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      backgroundColor: purple,
                      minimumSize: Size(double.infinity, 50 * heightF),
                    ),
                    child: Text(
                      "Quit Game",
                      style: TextStyle(color: white, fontSize: 20 * heightF),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (gridValues[index] == null) {
                        gridValues[index] = symbols[currentSymbolIndex];
                        currentSymbolIndex =
                            (currentSymbolIndex + 1) % symbols.length;
                      }
                      setState(() {});
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: gridValues[index] != null
                            ? Text(
                                gridValues[index]!,
                                style: const TextStyle(fontSize: 40),
                              )
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void resetGame() {
    gridValues = List.filled(9, null);
    currentSymbolIndex = 0;
    setState(() {});
  }
}
