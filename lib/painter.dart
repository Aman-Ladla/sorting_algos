import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sorting_algos/screen/mainScreen.dart';

Paint _paint;
List<List<int>> temp = [];
int time = 0;
List<int> arr;
double width;
int leftp;
int rightp;
String algo;
bool end;

class PaintingWdt extends StatefulWidget {
  PaintingWdt(List<int> x, double x1, int l, int r, String a, bool e) {
    arr = x;
    width = x1;
    leftp = l;
    rightp = r;
    algo = a;
    end = e;
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
          Rect.fromLTWH(a += width + 5, 40.0, width, arr[i].toDouble()),
          _paint);
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
