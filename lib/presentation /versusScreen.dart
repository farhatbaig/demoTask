import 'package:excel_acedmy/presentation%20/constants/assets_path.dart';
import 'package:excel_acedmy/presentation%20/quizScreen.dart';
import 'package:flutter/material.dart';

class VersusScreen extends StatelessWidget {
  const VersusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    EAAssets.logo,
                    width: 93,
                  ),
                  Image.asset(
                    EAAssets.leaderboard, 
                    width: 87,
                  ),
                ],
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      EAAssets.player2),
                ),
                const SizedBox(width: 15,),
                Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Adegoke Simisola",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.circle,
                            color: Colors.yellow, size: 22),
                        SizedBox(width: 5),
                        Text(
                          "1,162 Pts",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 160,
                      height: 15,
                      decoration: const BoxDecoration(
                        color: Color(0xff441FAF),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Image.asset(
              EAAssets.versusImage,
              height: 190,
            ),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                         EAAssets.player1),
                    ),
                    const SizedBox(width: 15,),
                    Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Omonigho Precious",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.circle,
                                color: Colors.yellow, size: 22),
                            SizedBox(width: 5),
                            Text(
                              "10,233 Pts",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 165,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Color(0xffAF1FA9),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

            // Start Game Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizScreen()),
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    backgroundColor: const Color(0xffFF822B),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 32),
                  ),
                  child: const Text(
                    "START GAME",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
