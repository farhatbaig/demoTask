import 'package:excel_acedmy/presentation%20/cardsSelectionScreen.dart';
import 'package:excel_acedmy/presentation%20/constants/assets_path.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final List<Map<String, dynamic>> cardData = [
    {
      "title": "Play with Zaraline (bot)",
      "description":
          "Quiz with a bot real-time and get scored to beat the highest scores",
      "availability":
          "This is not available at the moment as we are currently fixing it. We will be back shortly.",
      "image": EAAssets.persone,
      "available": true
    },
    {
      "title": "Play with someone on the app",
      "description":
          "Quiz with someone real-time and get scored to beat the highest scores",
      "availability": "",
      "image": EAAssets.persone,
      "available": true
    }
  ];

  int? selectedCardIndex;

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
            const SizedBox(height: 150),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cardData.length,
                itemBuilder: (context, index) {
                  final card = cardData[index];
                  final isSelected = selectedCardIndex == index;

                  return GestureDetector(
                    onTap: card['available']
                        ? () {
                            setState(() {
                              selectedCardIndex = index;
                            });
                          }
                        : null,
                    child: Card(
                      color: isSelected
                          ? Color(0xffFF822B).withOpacity(0.2)
                          : Colors.transparent,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: isSelected
                              ? Color(0xffFF822B)
                              : Color(0xff2A2A2A),
                          width: 3,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              card['image'],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    card['title'],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Color(0xffFF822B)
                                          : Color(0xffF3F3F1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    card['description'],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Color(0xffFF822B)
                                          : Color(0xff999999),
                                      fontSize: 14,
                                    ),
                                  ),
                                  if (card['availability'] != null &&
                                      card['availability'] != "")
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        card['availability'],
                                        style: TextStyle(
                                          color: isSelected
                                              ? Color(0xffFF822B)
                                              : Color(0xff545454),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedCardIndex != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CardSelectionScreen()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    backgroundColor: selectedCardIndex != null
                        ? const Color(0xffFF822B)
                        : Colors.grey,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 32),
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
