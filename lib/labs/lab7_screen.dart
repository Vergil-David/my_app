import 'package:flutter/material.dart';

class Lab7Screen extends StatelessWidget {
  const Lab7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Параметри з умови
    const double a = 20; // висота жовтої верхньої смуги
    const double b = 30; // товщина червоної рамки зверху
    const double c = 60; // висота синього прямокутника

    const double width = 320;      // ширина всієї композиції
    const double leftMargin = 40;  // відступ рамки від лівого краю
    const double redThickness = 30; // товщина вертикальної червоної смуги

    final double totalHeight = a + b + c;

    return Center(
      child: Stack(
        children: [
          /// ЖОВТЕ тло + верхня смуга (вся область)
          Container(
            width: width,
            height: totalHeight,
            color: Colors.yellow,
          ),

          /// ТЕКСТ "Hi! NLTU" у жовтій верхній смузі, по центру
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: a,
            child: Center(
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hi! ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'NLTU',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// ЧЕРВОНА горизонтальна смуга (верхня рамка)
          Positioned(
            top: a,
            left: leftMargin,
            right: 0,
            height: b,
            child: Container(
              color: Colors.red,
            ),
          ),

          /// ЧЕРВОНА вертикальна смуга (ліва рамка)
          Positioned(
            top: a,
            left: leftMargin,
            width: redThickness,
            height: b + c,
            child: Container(
              color: Colors.red,
            ),
          ),

          /// СИНІЙ прямокутник всередині червоної рамки
          Positioned(
            top: a + b,
            left: leftMargin + redThickness,
            right: 0,
            height: c,
            child: Container(
              color: Colors.cyan,
            ),
          ),
        ],
      ),
    );
  }
}
