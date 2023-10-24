import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final String assetName = 'assets/images/object.svg';
  final Random _random = Random();

  List<Color> colors = [
    Colors.black,
    Colors.redAccent,
    Colors.yellow,
    Colors.white,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.lime,
    Colors.purple,
    Colors.deepPurple,
    Colors.deepOrangeAccent
  ];
  int randomNumber = 0;
  FirebaseFirestore db = FirebaseFirestore.instance;
  void changeColor() {
    setState(() {
      randomNumber = _random.nextInt(colors.length);
    });
  }

  void setColorinFirestore() {
    db
        .collection("Colors")
        .doc("new color")
        .set({"colorName": colors[randomNumber].toString()}).onError(
            (e, _) => print("Error writing document: $e"));
    Fluttertoast.showToast(
        msg: "Firestore Updated",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromARGB(255, 232, 220, 255),
          Color.fromARGB(255, 158, 161, 255),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0xFF9876FF),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.sp),
              bottomRight: Radius.circular(20.sp),
            ),
          ),
          title: Text(
            'Kuriakose Demo App',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 15.sp),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            RotationTransition(
              turns: _animation,
              child: Center(
                child: SvgPicture.asset(
                  assetName,
                  width: 70.w,
                  colorFilter:
                      ColorFilter.mode(colors[randomNumber], BlendMode.srcIn),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                changeColor();
                setColorinFirestore();
              },
              elevation: 0,
              backgroundColor: const Color(0xFF9876FF),
              hoverColor: const Color.fromARGB(205, 227, 255, 246),
              focusColor: const Color(0xff009955),
              label: const Text('Tap to change color'),
              icon: const Icon(Icons.rotate_left_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
