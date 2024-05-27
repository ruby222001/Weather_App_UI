import 'package:flutter/material.dart';

class BottomModal extends StatefulWidget {
  final Map<String, dynamic> weatherData;

  const BottomModal({super.key, required this.weatherData});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
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
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.grey[300],
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffF7CBFD),
                    Color(0xff7758D1),
                  ],
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Hourly forecast',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Weekly Forecast',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      itemCount: hourlyWeatherForecast.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        String forecastHour = hourlyWeatherForecast[index]
                                ["time"]
                            .substring(11, 13);

                        String forecastWeatherName =
                            hourlyWeatherForecast[index]["condition"]["text"];
                        String forecastWeatherIcon =
                            "${forecastWeatherName.replaceAll(' ', '').toLowerCase()}.png";

                        String forecastTemperature =
                            hourlyWeatherForecast[index]["temp_c"]
                                .round()
                                .toString();
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 60,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff2E335A),
                                  offset: Offset(4, 4),
                                  blurRadius: 5,
                                  spreadRadius: double.infinity,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4, -4),
                                  blurRadius: 5,
                                )
                              ],
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff2E335A),
                                    Color(0xff1C1B33),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  forecastHour,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Image.asset(
                                  'assets/$forecastWeatherIcon',
                                  width: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      forecastTemperature,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 25),
                                      child: Text(
                                        'o',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontFeatures: [
                                            FontFeature.enable('sups'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      elevation: 4.0,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        margin: const EdgeInsets.all(15.0),
        child: const Icon(Icons.add),
      ),
    );
  }
}
