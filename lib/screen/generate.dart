import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String text;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Enter Your Input',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Eg: 12,45,31,22',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.zero,
                          bottomRight: Radius.circular(32.0),
                          bottomLeft: Radius.zero),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.zero,
                          bottomRight: Radius.circular(32.0),
                          bottomLeft: Radius.zero),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.zero,
                          bottomRight: Radius.circular(32.0),
                          bottomLeft: Radius.zero),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Input cant be empty';
                    }

                    return null;
                  },
                  autofocus: true,
                  onChanged: (value) {
                    text = value;
                  },
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 40.0,
              ),
            ),
            Material(
              color: Colors.lightBlueAccent,
              child: MaterialButton(
                onPressed: () {
                  List<int> temp = [];
                  temp.clear();
                  int high = 0;
                  int x = 0;
                  try {
                    while (x < text.length) {
                      String z = '';
                      while (x != text.length && text[x] != ',') {
                        z += text[x];
                        x++;
                      }
                      double t = double.parse(z);
                      temp.add(t.round());
                      if (high < t.round()) {
                        high = t.round();
                      }
                      x++;
                    }

                    if (temp.length >= 3 && temp.length <= 17) {
                      _formKey.currentState.save();
                      Navigator.pop(context, temp);
                    } else {
                      Fluttertoast.showToast(
                          msg:
                              "Elements must be greater than 2 and less than 18",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black54,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: "Input Elements are invalid",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
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
