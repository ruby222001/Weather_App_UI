import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class SearchBartop extends StatelessWidget {
  const SearchBartop({super.key});

  @override
  Widget build(BuildContext context) {
    Offset offset = const Offset(4, 4);
    double blurRadius = 10.0;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff312B5B),
          borderRadius: BorderRadius.circular(32.0),
          boxShadow: [
            BoxShadow(
              blurRadius: blurRadius,
              offset: -offset,
              color: Colors.black12,
              inset: true,
            ),
            BoxShadow(
              blurRadius: blurRadius,
              color: Colors.black12,
              blurStyle: BlurStyle.inner,
              spreadRadius: (2.0),
            ),
          ],
        ),
        child: TextField(
          
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Colors.white54),
            hintText: 'Search for a city or airport',
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
            fillColor: const Color(0xff312B5B),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          ),
        ),
      ),
    );
  }
}
