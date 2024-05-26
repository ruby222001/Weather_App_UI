// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/config/resources/images.dart';
import 'package:weatherapp/feature/presentation/intro_page.dart';
import 'package:http/http.dart' as http;

import 'package:weatherapp/feature/widget/home_container.dart';
import 'package:weatherapp/feature/widget/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cityController = TextEditingController();

  static String apikey = '81c3b50a208b46c2afa05611242605';
  List<Map<String, dynamic>> locationsWeather = [];
  List<String> initialLocations = [
    'London',
    'New York',
    'Tokyo',
    'Paris',
    'Sydney'
  ];

  // API Call
  String searchWeatherAPI =
      "https://api.weatherapi.com/v1/forecast.json?key=$apikey&days=7&q=";

  void fetchWeatherData(String searchText) async {
    try {
      var searchResult =
          await http.get(Uri.parse(searchWeatherAPI + searchText));

      final weatherData = Map<String, dynamic>.from(
          json.decode(searchResult.body) ?? 'No data');

      var locationData = weatherData["location"];
      var currentWeather = weatherData["current"];
      var dailyWeatherForecast = weatherData["forecast"]["forecastday"];
      var hourlyWeatherForecast = dailyWeatherForecast[0]["hour"];
      var parsedDate =
          DateTime.parse(locationData["localtime"].substring(0, 10));
      var newDate = DateFormat('MMMMEEEEd').format(parsedDate);

      setState(() {
        locationsWeather.add({
          "location": getShortLocationName(locationData["name"]),
          "currentDate": newDate,
          "currentWeatherStatus": currentWeather["condition"]["text"],
          "weatherIcon":
              "${currentWeather["condition"]["text"].replaceAll(' ', '').toLowerCase()}.png",
          "temperature": currentWeather["temp_c"].toInt(),
          "windSpeed": currentWeather["wind_kph"].toInt(),
          "humidity": currentWeather["humidity"].toInt(),
          "cloud": currentWeather["cloud"].toInt(),
          "dailyWeatherForecast": dailyWeatherForecast,
          "hourlyWeatherForecast": hourlyWeatherForecast,
        });
      });
    } catch (e) {
      print(e);
    }
  }

  static String getShortLocationName(String s) {
    List<String> wordList = s.split(" ");

    if (wordList.isNotEmpty) {
      if (wordList.length > 1) {
        return "${wordList[0]} ${wordList[1]}";
      } else {
        return wordList[0];
      }
    } else {
      return " ";
    }
  }

  @override
  void initState() {
    super.initState();
    for (var location in initialLocations) {
      fetchWeatherData(location);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff312B5B),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                    backgroundColor: Colors.transparent,
                    leading: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IntroPage(),
                            ),
                          );
                        },
                        child: Image.asset(AppIcons.left)),
                    elevation: 0,
                    title: const Text(
                      'Weather',
                      style: TextStyle(color: Colors.white),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(AppIcons.rightmenu),
                      ),
                    ]),
                TextField(
                  onSubmitted: (searchText) {
                    setState(() {
                      locationsWeather.clear();
                    });
                    fetchWeatherData(searchText);
                  },
                  controller: _cityController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.white54),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          _cityController.clear();
                        },
                        child: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                        )),
                    hintText: 'Search for a city',
                    hintStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    fillColor: const Color(0xff312B5B),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 24.0),
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: locationsWeather.length,
                  itemBuilder: (context, index) {
                    var weather = locationsWeather[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CustomContainer(
                        degree: weather["temperature"].toString(),
                        location: weather["location"],
                        weather: weather["currentWeatherStatus"],
                        imagepath: "assets/" + weather["weatherIcon"],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
