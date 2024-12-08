import 'package:excel_acedmy/presentation%20/constants/assets_path.dart';
import 'package:excel_acedmy/presentation%20/listing.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward().whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, right: 20),
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Image.asset(
                    EAAssets.leaderboard,
                    width: 87,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Image.asset(
                            EAAssets.logo,
                            width: 135,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isLoading)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 82,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width *
                              _animation.value,
                          height: 82,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Text(
                            "${(_animation.value * 100).toInt()}%",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 500,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CardScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      backgroundColor: const Color(0xffFF822B),
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
