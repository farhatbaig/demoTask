import 'package:excel_acedmy/presentation/constants/assets_path.dart';
import 'package:flutter/material.dart';

class FinalScoreScreen extends StatelessWidget {
  const FinalScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: 500,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(EAAssets.player2),
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.circle, color: Colors.yellow, size: 18),
                              SizedBox(width: 5),
                              Text(
                                "8 Pts",
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 80,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Color(0xffAF1FA9),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          "00:04",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(EAAssets.player2),
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.circle, color: Colors.yellow, size: 18),
                              SizedBox(width: 5),
                              Text(
                                "0 Pts",
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 80,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Color(0xff441FAF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xff191919),
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your Final Score",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 100),
                          Icon(Icons.circle, color: Colors.yellow, size: 30),
                          SizedBox(height: 10),
                          Text(
                            "334",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Points overall",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 80),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Congratulations Buddy! ✌️",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 14),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.replay, color: Colors.white),
                                    SizedBox(width: 10),
                                    Icon(Icons.flag, color: Colors.white),
                                    SizedBox(width: 10),
                                    Icon(Icons.info_outline, color: Colors.white),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffFF822B),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                  ),
                                ),
                                child: const Text(
                                  "VIEW LEADERBOARD",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
