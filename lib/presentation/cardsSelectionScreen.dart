import 'package:excel_acedmy/presentation/versusScreen.dart';
import 'package:flutter/material.dart';

class CardSelectionScreen extends StatefulWidget {
  const CardSelectionScreen({Key? key}) : super(key: key);

  @override
  _CardSelectionScreenState createState() => _CardSelectionScreenState();
}

class _CardSelectionScreenState extends State<CardSelectionScreen> {
  final List<Map<String, dynamic>> cards = [
    {
      "title": "ICAN",
      "subtitle": "Institute Chartered Accountants of Nigeria",
      "image": "assets/images/ican.png",
      "borderColor": Colors.blueAccent,
    },
    {
      "title": "ACCA",
      "subtitle": "Association of Chartered Certified Accountants",
      "image": "assets/images/acca.png",
      "borderColor": Colors.deepOrangeAccent,
    },
    {
      "title": "CITN",
      "subtitle": "Chartered Institute of Taxation of Nigeria",
      "image": "assets/images/citn.png",
      "borderColor": Colors.greenAccent,
    },
    {
      "title": "CIMA",
      "subtitle": "Chartered Institute of Management Accountants (CIMA)",
      "image": "assets/images/cima.png",
      "borderColor": Colors.purpleAccent,
    },
    {
      "title": "CIBM",
      "subtitle": "Chartered Institute of Taxation of Nigeria",
      "image": "assets/images/citn.png",
      "borderColor": Colors.orange,
    },
    {
      "title": "ANAN",
      "subtitle": "Chartered Institute of Management Accountants (CIMA)",
      "image": "assets/images/cima.png",
      "borderColor": Colors.blue,
    },
  ];

  final List<int> selectedCardIndices = []; // Track multiple selected cards

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
                  Image.asset(
                    "assets/images/logo.png",
                    width: 93,
                  ),
                  Image.asset(
                    "assets/images/leaderboard.png", 
                    width: 87,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    final isSelected = selectedCardIndices.contains(index);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedCardIndices.remove(index);
                          } else {
                            selectedCardIndices.add(index);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              top: 50,
                              bottom: 0,
                              child: Container(
                                width: 4,
                                color: card['borderColor'],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 7, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        card['title'],
                                        style: const TextStyle(
                                          color: Color(0xff6C6C6C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelected) {
                                              selectedCardIndices.remove(index);
                                            } else {
                                              selectedCardIndices.add(index);
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: const Color(0xFF323232),
                                              width: 2,
                                            ),
                                            color: isSelected
                                                ? card['borderColor']
                                                : const Color(0xff2A2A2A),
                                          ),
                                          child: isSelected
                                              ? const Icon(
                                                  Icons.check,
                                                  size: 16,
                                                  color: Colors.black,
                                                )
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Image.asset(
                                    card['image'],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    card['subtitle'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedCardIndices.isNotEmpty
                      ? () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VersusScreen()),
                      );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    backgroundColor: selectedCardIndices.isNotEmpty
                        ? const Color(0xffFF822B)
                        : Colors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  ),
                  child: const Text(
                    "CONTINUE",
                    style: TextStyle(
                      color: Color(0xffF9FAFB),
                      fontSize: 14,
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
