import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/feature/model/model.dart';

class WeatherDataPage extends StatefulWidget {
  const WeatherDataPage({Key? key}) : super(key: key);

  @override
  _WeatherDataPageState createState() => _WeatherDataPageState();
}

class _WeatherDataPageState extends State<WeatherDataPage> {
  late Future<WeatherDataModel> _futureWeatherData;

  Future<WeatherDataModel> fetchWeatherData() async {
    final response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=bac5d191517489b98571c0271ee82861"));

    if (response.statusCode == 200) {
      final apidata = weatherDataModelFromJson(response.body);
      return apidata;
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureWeatherData = fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherDataModel>(
      future: _futureWeatherData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data != null) {
          final weatherData = snapshot.data!;
          final itemCount =
              weatherData.list.length < 5 ? weatherData.list.length : 5;

          return ListView.builder(
            itemCount: itemCount,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final weatherElement = weatherData.list[index];
              final weather = weatherElement.weather.first;
              final iconUrl =
                  "http://openweathermap.org/img/wn/${weather.icon}.png";
              // Convert Kelvin to Celsius and Fahrenheit
              final tempCelsius = weatherElement.main.temp - 273.15;
              return Container(
                height: 140,
                width: 60,
                margin: const EdgeInsets.all(8.0),
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
                  gradient: LinearGradient(
                      colors: [Color(0xff2E335A), Color(0xff1C1B33)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${weatherElement.dtTxt.hour}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Image.network(iconUrl),
                      Text(
                        '${tempCelsius.toStringAsFixed(1)}°C',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
