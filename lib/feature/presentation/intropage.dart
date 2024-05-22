import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:weatherapp/config/resources/images.dart';
import 'package:weatherapp/feature/presentation/widget/weathercontainer.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/icons/star.png',
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Montreal',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '19',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: Icon(
                          Icons.radio_button_unchecked,
                          color: Colors.white,
                          weight: 20,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Mostly Clear',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'H:24 L:18',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/House.png',
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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        color: Colors.deepPurple.shade300,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          CurvedNavigationBarItem(
            child: Image.asset(
              AppIcons.map,
              width: 40,
              height: 40,
            ),
          ),
          CurvedNavigationBarItem(
            child: Image.asset(
              AppIcons.add,
              width: 40,
              height: 40,
            ),
          ),
          CurvedNavigationBarItem(
            child: Image.asset(
              AppIcons.symbol,
              width: 40,
              height: 40,
            ),
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            showModalBottomSheet(
              backgroundColor: Colors.grey[300],
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffF7CBFD),
                        Color(0xff7758D1),
                      ],
                    ),
                  ),
                  child: const Column(
                    children: [
                      Padding(
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
                      Divider(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            WeatherContainer(
                              time: '12AM',
                              weatherimage: AppIcons.smallcloud,
                              weatherdegree: '19',
                            ),
                            WeatherContainer(
                              time: '1AM',
                              weatherimage: AppIcons.smallcloud,
                              weatherdegree: '18',
                            ),
                            WeatherContainer(
                              time: '2AM',
                              weatherimage: AppIcons.smallcloud,
                              weatherdegree: '17',
                            ),
                            WeatherContainer(
                              time: '3AM',
                              weatherimage: AppIcons.smallcloud,
                              weatherdegree: '16',
                            ),
                            WeatherContainer(
                              time: '4AM',
                              weatherimage: AppIcons.smallcloud,
                              weatherdegree: '15',
                            ),
                            WeatherContainer(
                              time: '5AM',
                              weatherimage: AppIcons.smallcloud,
                              weatherdegree: '14',
                            ),
                            WeatherContainer(
                              time: '12AM',
                              weatherimage: AppIcons.smallcloud,
                              weatherdegree: '19',
                            ),
                            WeatherContainer(
                              time: '12AM',
                              weatherimage: AppIcons.smallcloud,
                              weatherdegree: '19',
                            ),
                            WeatherContainer(
                              time: '12AM',
                              weatherimage: AppIcons.smallcloud,
                              weatherdegree: '19',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
