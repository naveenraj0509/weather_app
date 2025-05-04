import 'package:flutter/material.dart';

class WeatherHourWidget extends StatefulWidget {
  final String time;
  final AssetImage image;
  final String temp;
  const WeatherHourWidget({super.key, required this.time, required this.image, required this.temp});

  @override
  State<WeatherHourWidget> createState() => _WeatherHourWidgetState();
}

class _WeatherHourWidgetState extends State<WeatherHourWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.time,style: TextStyle(fontSize: 22,color: Colors.white)
              ,),
            Image(image: widget.image,height:32 ,width:32
            ),
            Text(widget.temp,style: TextStyle(fontSize: 20,color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
