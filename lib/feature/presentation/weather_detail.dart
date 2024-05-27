import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/config/resources/images.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weatherapp/feature/model/bottom_navbar.dart';
import 'package:weatherapp/feature/model/bottom_modal.dart';

class WeatherDetailPage extends StatefulWidget {
  final Map<String, dynamic> weatherData;

  WeatherDetailPage({super.key, required this.weatherData});

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  late String location;
  late String weatherIcon;
  late int temperature;
  late int windSpeed;
  late int humidity;
  late int cloud;
  late String currentDate;
  late List hourlyWeatherForecast;
  late List dailyWeatherForecast;
  late String currentWeatherStatus;

  @override
  void initState() {
    super.initState();
    fetchWeatherData(widget.weatherData);
  }

  void fetchWeatherData(Map<String, dynamic> weatherData) {
    setState(() {
      location = weatherData["location"];
      currentDate = weatherData["currentDate"];
      currentWeatherStatus = weatherData["currentWeatherStatus"];
      weatherIcon = weatherData["weatherIcon"];
      temperature = weatherData["temperature"];
      windSpeed = weatherData["windSpeed"];
      humidity = weatherData["humidity"];
      cloud = weatherData["cloud"];
      dailyWeatherForecast = weatherData["dailyWeatherForecast"];
      hourlyWeatherForecast = weatherData["hourlyWeatherForecast"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppIcons.star,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    location,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        temperature.toString(),
                        style: const TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: Icon(
                          Icons.radio_button_unchecked,
                          color: Colors.white,
                          weight: 20,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    currentWeatherStatus,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'H:24 L:18',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    AppIcons.house,
                    height: 400,
                    width: 300,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomModal(
        weatherData: widget.weatherData,
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
