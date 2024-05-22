import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:weatherapp/config/resources/images.dart';
import 'package:weatherapp/feature/presentation/widget/container.dart';
import 'package:weatherapp/feature/presentation/widget/search.dart';

import 'package:weatherapp/feature/presentation/intropage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff312B5B),
      body: Container(
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppBar(
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
                    child: Image.asset(AppIcons.leftarrow),
                  ),
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
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SearchBartop(),
              ),
              const SizedBox(height: 10),
              const CustomContainer(
                degree: '19',
                location: 'Montreal, Canada',
                hldegree: 'H:24 L:18',
                weather: 'Mid Rain',
                imagepath: AppIcons.midrain,
              ),
              const SizedBox(height: 20),
              const CustomContainer(
                degree: '20',
                location: 'Toronto, Canada',
                hldegree: 'H:21 L:19',
                weather: 'Fast Wind',
                imagepath: AppIcons.cloudy,
              ),
              const SizedBox(height: 20),
              const CustomContainer(
                degree: '13',
                location: 'Tokyo, Japan',
                hldegree: 'H:16 L:8',
                weather: 'Showers',
                imagepath: AppIcons.sunmidrain,
              ),
              const SizedBox(height: 20),
              const CustomContainer(
                degree: '19',
                location: 'Montreal, Canada',
                hldegree: 'H:24 L:18',
                weather: 'Mid Rain',
                imagepath: AppIcons.sun,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
