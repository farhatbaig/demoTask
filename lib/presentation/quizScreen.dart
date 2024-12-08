import 'dart:async';
import 'package:excel_acedmy/presentation/constants/assets_path.dart';
import 'package:excel_acedmy/presentation/finalScoreScreen.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int timer = 25; 
  late Timer countdownTimer;
  final List<int> selectedAnswers = [];
  final List<String> options = [
    "Indirect costs",
    "Variable costs",
    "Semi-variable costs",
    "Performance evaluation"
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (this.timer > 0) {
          this.timer--;
        } else {
          countdownTimer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
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
                          Icon(Icons.monetization_on, color: Colors.yellow, size: 18),
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
                  // Timer
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffFF822B), width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "00:${timer.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Player 2 info
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(EAAssets.player1),
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
            // Question Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "What are the different types of costs in management accounting?",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedAnswers.contains(index);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedAnswers.remove(index);
                        } else {
                          selectedAnswers.add(index);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xff0A3A26) : Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                        border: isSelected
                            ? Border.all(color: const Color(0xff1FAF73), width: 2)
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        options[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            if (selectedAnswers.isNotEmpty)
              Container(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Keep going Buddy! ✌️",
                          style: TextStyle(color: Colors.white, fontSize: 14),
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
                        onPressed: () {
                             Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FinalScoreScreen()),
                      );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFF822B),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                        child: const Text(
                          "CONTINUE",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
