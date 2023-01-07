import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:random_name_picker/cubit/name_cubit.dart';

var names = [
  "Priyanshu",
  "Gargi",
  "Aman",
  "Dhruvi",
  "Parth",
  "Shivam",
  "Satyam",
  "Jigyasa"
];

extension RandomElement<String> on Iterable<String> {
  String getRandomElement() => elementAt(math.Random().nextInt(length));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final NamesCubit namesCubit;

  @override
  void initState() {
    super.initState();
    namesCubit = NamesCubit();
  }

  @override
  void dispose() {
    namesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: StreamBuilder<String?>(
              stream: namesCubit.stream,
              builder: (context, snapshot) {
                var button = TextButton(
                  onPressed: () {
                    namesCubit.pickRandomName();
                  },
                  child: const Text("get Random Name"),
                );
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Column(
                      children: [Text(snapshot.data ?? ""), button],
                    );
                    break;
                  case ConnectionState.waiting:
                    return Column(
                      children: [Text(snapshot.data ?? ""), button],
                    );
                    break;
                  case ConnectionState.active:
                    return Column(
                      children: [Text(snapshot.data ?? ""), button],
                    );
                    break;
                  case ConnectionState.done:
                    return Container();
                    break;
                }
              })),
    );
  }
}
