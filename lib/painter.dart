import 'package:flutter/material.dart';

Paint _paint;
List<List<int>> temp = [];
int time = 0;
List<int> arr;
double width;
int leftp;
int rightp;
String algo;
bool end;
int max;

class PaintingWdt extends StatefulWidget {
  PaintingWdt(List<int> x, double x1, int l, int r, String a, bool e, int h) {
    arr = x;
    width = x1;
    leftp = l;
    rightp = r;
    algo = a;
    end = e;
    max = h;
  }

  @override
  _PaintingWdtState createState() => _PaintingWdtState();
}

class _PaintingWdtState extends State<PaintingWdt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: Painter(c: arr),
      ),
    );
  }
}

class Painter extends CustomPainter {
  final List<int> c;

  Painter({this.c}) {
    _paint = Paint()..color = Colors.blue;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double a = 0.0;
    double b = 0.0;
    for (int i = 0; i < arr.length; i++) {
      if (algo == 'Merge Sort' || algo == 'Bubble Sort') {
        if (i >= leftp && i <= rightp) {
          _paint = Paint()..color = Colors.green;
        } else {
          _paint = Paint()..color = Colors.blue;
        }
      } else {
        if (end) {
          if (i >= leftp && i <= rightp) {
            _paint = Paint()..color = Colors.green;
          }
        } else if (i == leftp || i == rightp) {
          _paint = Paint()..color = Colors.green;
        } else {
          _paint = Paint()..color = Colors.blue;
        }
      }
      canvas.drawRect(
          Rect.fromLTWH(
              a += width + 5, 60.0, width, (arr[i].toDouble()) / max * 280),
          _paint);
      final textStyle = TextStyle(
        color: Colors.black,
      );
      final textSpan = TextSpan(
        text: arr[i].toString(),
        style: textStyle,
      );
      final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          maxLines: 3);
      final offset = Offset(b += width + 5, 10);
      textPainter.layout(minWidth: width, maxWidth: width);
      textPainter.paint(canvas, offset);
    }
    print('hello 0');
    print('paint method called abcd');
  }

  @override
  bool shouldRepaint(Painter oldDelegate) {
    return true;
  }
  // throw UnimplementedError();
  //=> !listEquals(oldDelegate.c, this.c);
}
