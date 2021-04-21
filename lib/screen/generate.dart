import 'package:flutter/material.dart';

String text;

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
              child: TextField(
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
                autofocus: true,
                onChanged: (value) {
                  text = value;
                },
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
                  //Provider.of<TaskData>(context, listen: false).addTask(text);
                  Navigator.pop(context, text);
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
