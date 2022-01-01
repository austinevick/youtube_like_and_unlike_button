import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int likes = 0;
  int dislike = 0;
  bool isLike = false;
  bool isDisLike = false;
  bool isTapped = false;
  String get text => !isTapped ? 'SUBSCRIBE' : 'SUBSCRIBED';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 40,
                  width: 150,
                  child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          isTapped = !isTapped;
                        });
                      },
                      child: Text(
                        text,
                        style: TextStyle(
                            color: isTapped ? Colors.grey : Colors.red,
                            fontWeight: FontWeight.bold),
                      ))),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isLike = !isLike;
                            if (isLike) {
                              isDisLike = false;
                              likes = max(1, 0);
                              dislike = max(0, 0);
                            } else if (!isLike) {
                              likes = max(0, 0);
                            }
                          });
                        },
                        icon: isLike
                            ? const Icon(Icons.thumb_up)
                            : const Icon(Icons.thumb_up_outlined)),
                    Text('$likes')
                  ]),
                  Column(children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isDisLike = !isDisLike;
                            if (isDisLike) {
                              isLike = false;
                              dislike = max(1, 0);
                              likes = max(0, 0);
                            } else if (!isDisLike) {
                              dislike = max(0, 0);
                            }
                          });
                        },
                        icon: isDisLike
                            ? const Icon(Icons.thumb_down)
                            : const Icon(Icons.thumb_down_outlined)),
                    Text('$dislike')
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
