// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo/util/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller; //to access controller of the text input of createing a new task
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller, //to get the user input
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            //buttons to save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: 'Save', onPressed: onSave),

                SizedBox(
                  width: 8,
                ),
                //cancel button
                MyButton(text: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
