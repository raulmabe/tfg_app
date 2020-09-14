import 'package:flutter/material.dart';

class DraggableIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Colors.grey,
        child: SizedBox(
          width: 30,
          height: 5,
        ),
      ),
    );
  }
}
