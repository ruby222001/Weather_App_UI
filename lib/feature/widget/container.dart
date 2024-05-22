import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String degree;
  final String location;
  final String weather;
  final String hldegree;
  final String imagepath;

  const CustomContainer({
    super.key,
    required this.degree,
    required this.location,
    required this.hldegree,
    required this.weather,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 342,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff5936B4),
                  Color(0xff362A84),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
                topLeft: Radius.circular(40),
                topRight: Radius.elliptical(700, 200),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: const Offset(-3, -3),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  offset: const Offset(3, 3),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            degree,
                            style: const TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                            ),
                          ),
                     const  Padding(
                            padding:  EdgeInsets.only(bottom: 25),
                            child:  Icon(
                              Icons.radio_button_unchecked,
                              color: Colors.white,
                              weight: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        hldegree,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Row(
                        children: [
                          Text(
                            location,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 120),
                          Text(
                            weather,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -10,
            top: -10,
            child: Image.asset(imagepath, width: 120, height: 120),
          ),
        ],
      ),
    );
  }
}
