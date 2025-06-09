import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TweenAnimationScreen(),
    theme: ThemeData(
      fontFamily: 'SF Pro',
      brightness: Brightness.light,
    ),
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
      backgroundColor: Color(0xFFEDF7F6), // Light teal background
      appBar: AppBar(
        backgroundColor: Color(0xFF006D77), // Deep teal
        elevation: 0,
        title: Text(
          'Tween Animation',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Color(0xFF83C5BE), // Sea green
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 16,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Adjust Upload Progress',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF073B4C),
                        ),
                      ),
                      SizedBox(height: 20),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 6,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20),
                          activeTrackColor: Color(0xFF006D77),
                          inactiveTrackColor: Color(0xFF006D77).withOpacity(0.2),
                          thumbColor: Color(0xFF006D77),
                          overlayColor: Color(0xFF006D77).withOpacity(0.2),
                        ),
                        child: Slider(
                          value: _progress,
                          min: 0.0,
                          max: 1.0,
                          divisions: 100,
                          label: '${(_progress * 100).toInt()}%',
                          onChanged: (value) {
                            setState(() {
                              _progress = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: _progress),
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        builder: (context, value, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 160,
                                height: 160,
                                child: CircularProgressIndicator(
                                  value: value,
                                  strokeWidth: 10,
                                  backgroundColor: Color(0xFFEDF7F6),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF006D77),
                                  ),
                                ),
                              ),
                              Text(
                                '${(value * 100).toInt()}%',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF073B4C),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Uploading file...',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF073B4C).withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}