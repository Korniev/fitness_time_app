import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 80,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: Colors.black),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderTile extends StatelessWidget {
  final String title;
  final double value;
  final String measureUnit;

  const SliderTile({
    Key? key,
    required this.title,
    required this.value,
    required this.measureUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(),
          ),
          Expanded(
            child: Slider(
              value: value,
              min: 0,
              max: measureUnit == 'cm' ? 250 : 150,
              divisions: 250,
              label: value.round().toString(),
              onChanged: (double value) {},
              activeColor: Theme.of(context).colorScheme.secondary,
              inactiveColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            "${value.round()} $measureUnit",
            style: GoogleFonts.montserrat(),
          ),
        ],
      ),
    );
  }
}
