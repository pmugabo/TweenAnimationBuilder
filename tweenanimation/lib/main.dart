import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TweenAnimationScreen(),
  ));
}

class TweenAnimationScreen extends StatefulWidget {
  @override
  _TweenAnimationScreenState createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Adjust Progress',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _progress,
              min: 0.0,
              max: 1.0,
              divisions: 100,
              label: (_progress * 100).toInt().toString() + '%',
              onChanged: (value) {
                setState(() {
                  _progress = value;
                });
              },
            ),
            SizedBox(height: 40),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: _progress),
              duration: Duration(seconds: 1),
              builder: (context, value, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: value,
                        strokeWidth: 8,
                        backgroundColor: Colors.grey.shade300,
                        color: Colors.red,
                      ),
                    ),
                    Text('${(value * 100).toInt()}%',
                        style: TextStyle(fontSize: 24))
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
