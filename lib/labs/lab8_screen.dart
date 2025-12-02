import 'package:flutter/material.dart';

class Lab8Screen extends StatelessWidget {
  const Lab8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Параметри з варіанту (як у лабі 6)
    const double j = 750; // ширина всього полотна
    const double h = 500; // висота всього полотна
    const double n = 5;   // лівий відступ жовтого
    const double f = 150; // ширина жовтого блоку
    const double i = 100; // висота жовтого блоку
    const double k = 100; // відступ між жовтим і синім
    const double g = 450; // ширина синього блоку
    const double b = 250; // висота синього блоку
    const double r = 6;   // вертикальний проміжок між верхнім і нижнім
    const double p = 4;   // додатковий відступ до білого
    const double d = 150; // висота білого блоку

    return Center(
      child: Container(
        width: j,
        height: h,
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white70, width: 2),
        ),
        child: Stack(
          children: [
            // Жовтий блок
            Positioned(
              left: n,
              top: 100,
              child: HymnCard(
                width: f,
                height: i,
                backgroundColor: Colors.yellow,
                borderColor: Colors.black,
                textColor: Colors.black,
                title: 'Куплет 1',
                text: 'Ще не вмерла Україна…', // короткий текст
              ),
            ),

            // Синій блок
            Positioned(
              left: n + f + k,
              top: 100,
              child: HymnCard(
                width: g,
                height: b,
                backgroundColor: const Color(0xFF3B82F6),
                borderColor: Colors.black,
                textColor: Colors.white,
                title: 'Куплет 2',
                text: 'Згинуть наші воріженьки…',
              ),
            ),

            // Білий блок
            Positioned(
              left: n + f + k + p,
              top: 100 + b + r,
              child: HymnCard(
                width: g - p,
                height: d,
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                textColor: Colors.black,
                title: 'Куплет 3',
                text: 'Покажем, що ми, браття…',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Власний віджет, успадкований від StatelessWidget
/// Мінімум 3 властивості передаємо через конструктор:
/// - backgroundColor
/// - textColor
/// - text
/// + width, height, title, borderColor, elevation
class HymnCard extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double elevation;

  const HymnCard({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.text,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    this.elevation = 6,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: backgroundColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DefaultTextStyle(
            style: TextStyle(color: textColor, fontSize: 14, height: 1.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
