import 'package:flutter/material.dart';

class WeatherContainer extends StatelessWidget {
  final String time;
  final String weatherimage;
  final String weatherdegree;
  const WeatherContainer({
    super.key,
    required this.time,
    required this.weatherimage,
    required this.weatherdegree,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Color(0xff2E335A),
              offset: Offset(4, 4),
              blurRadius: 5,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 5,
            )
          ],
          gradient: LinearGradient(colors: [
            Color(0xff2E335A),
            Color(0xff1C1B33),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        height: 130,
        width: 50,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                time,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 5),
              Image.asset(weatherimage),
              const SizedBox(height: 5),
              Text(
                weatherdegree,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
