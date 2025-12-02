import 'package:flutter/material.dart';

class Lab6Screen extends StatelessWidget {
  const Lab6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Параметри з варіанту
    const double j = 750; // ширина всього
    const double h = 500; // висота всього
    const double n = 5;   // лівий відступ жовтого
    const double f = 150; // ширина жовтого
    const double i = 100; // висота жовтого
    const double k = 100; // відступ між жовтим і синім
    const double g = 450; // ширина синього
    const double b = 250; // висота синього
    const double r = 6;   // вертикальний відступ вниз
    const double p = 4;   // відступ зліва білого блоку

    const double d = 150; // висота білого блоку

    return Center(
      child: Container(
        width: j,
        height: h,
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          border: Border.all(color: Colors.white70, width: 2),
        ),
        child: Stack(
          children: [

            /// Жовтий блок
            Positioned(
              left: n,
              top: 100, 
              child: _Block(
                width: f,
                height: i,
                color: Colors.yellow,
                border: Colors.black,
                textColor: Colors.black,
                text:
                    'Ще не вмерла Україна, і\nслава, і воля,\nще нам, браття\nмолодії…',
              ),
            ),

            /// Синій блок
            Positioned(
              left: n + f + k, // жовтий + відступ k
              top: 100,
              child: _Block(
                width: g,
                height: b,
                color: Colors.lightBlue.shade400,
                border: Colors.black,
                textColor: Colors.black,
                text:
                    'Згинуть наші воріженьки,\nяк роса на сонці,\nзапануєм і ми, браття,\nу своїй сторонці.',
              ),
            ),

            /// Білий блок (нижній)
            Positioned(
              left: n + f + k + p, // справа від синього
              top: 100 + b + r, // під синім з відступом r
              child: _Block(
                width: g - p,
                height: d,
                color: Colors.white,
                border: Colors.black,
                textColor: Colors.black,
                text:
                    'І покажем, що ми, браття,\nкозацького роду.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Block extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color border;
  final Color textColor;
  final String text;

  const _Block({
    required this.width,
    required this.height,
    required this.color,
    required this.border,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: border, width: 2),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          height: 1.3,
        ),
      ),
    );
  }
}
