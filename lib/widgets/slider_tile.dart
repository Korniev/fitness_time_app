import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
