import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello my name Keramas Wiguna',
              style: TextStyle(fontFamily: 'Nunito'),
            ),
            SizedBox(height: 20.0),
            Text(
              'What next ?',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              '• Persist data with SqlLite\n• Make more beautiful deisgn\n• Add category for todo\n• Data Online with Firestore',
              style: TextStyle(fontFamily: 'Nunito', fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }
}
