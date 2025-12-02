import 'package:flutter/material.dart';

class Lab9Screen extends StatelessWidget {
  const Lab9Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ті ж параметри, що й у лабі 6
    const double j = 750; // ширина полотна
    const double h = 500; // висота полотна
    const double n = 5;   // лівий відступ жовтого
    const double f = 150; // ширина жовтого блоку
    const double i = 100; // висота жовтого блоку
    const double k = 100; // відступ між жовтим і синім
    const double g = 450; // ширина синього блоку
    const double b = 250; // висота синього блоку
    const double r = 6;   // вертикальний проміжок
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
              child: HymnCardInteractive(
                width: f,
                height: i,
                title: 'Куплет 1',
                text: 'Ще не вмерла Україна…',
                backgroundColor: Colors.yellow,
                borderColor: Colors.black,
                textColor: Colors.black,
                initialElevation: 4,
              ),
            ),

            // Синій блок
            Positioned(
              left: n + f + k,
              top: 100,
              child: HymnCardInteractive(
                width: g,
                height: b,
                title: 'Куплет 2',
                text: 'Згинуть наші воріженьки…',
                backgroundColor: const Color(0xFF3B82F6),
                borderColor: Colors.black,
                textColor: Colors.white,
                initialElevation: 6,
              ),
            ),

            // Білий блок
            Positioned(
              left: n + f + k + p,
              top: 100 + b + r,
              child: HymnCardInteractive(
                width: g - p,
                height: d,
                title: 'Куплет 3',
                text: 'Покажем, що ми, браття…',
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                textColor: Colors.black,
                initialElevation: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Власний віджет у стилі Material Design
/// 🔹 Успадкований від StatefulWidget
/// 🔹 Через конструктор передається купа параметрів (width, height, title,
///    text, backgroundColor, borderColor, textColor, initialElevation)
class HymnCardInteractive extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double initialElevation;

  const HymnCardInteractive({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.text,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    this.initialElevation = 4,
  });

  @override
  State<HymnCardInteractive> createState() => _HymnCardInteractiveState();
}

class _HymnCardInteractiveState extends State<HymnCardInteractive> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    final bg = _selected
        ? widget.backgroundColor.withOpacity(0.9)
        : widget.backgroundColor;
    final elev = _selected ? widget.initialElevation + 4 : widget.initialElevation;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Card(
        color: bg,
        elevation: elev,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: widget.borderColor, width: 2),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            setState(() {
              _selected = !_selected;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultTextStyle(
              style: TextStyle(
                color: widget.textColor,
                fontSize: 12,
                height: 1.2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: widget.textColor.withOpacity(0.8),
                          ),
                        ),
                      ),
                      if (_selected)
                        Icon(
                          Icons.check_circle,
                          size: 16,
                          color: widget.textColor.withOpacity(0.8),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      widget.text,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
