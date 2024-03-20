import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceButton extends StatelessWidget {
  const PlaceButton({
    Key? key,
    required this.onPressed,
    required this.imagePath,
    required this.placeName,
    required this.coordinates,
    required this.labelFontSize,
    required this.iconWidth,
    required this.iconHeight,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String imagePath;
  final String placeName;
  final LatLng coordinates;
  final double labelFontSize;
  final double iconWidth;
  final double iconHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.25,
        height: 55,
        child: ElevatedButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(5),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(20, 20),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFF609FD8),
            ),
          ),
          onPressed: onPressed,
          icon: Image.asset(
            imagePath,
            width: iconWidth,
            height: iconHeight,
          ),
          label: FittedBox(
            child: Text(
              placeName,
              style: TextStyle(
                color: Colors.white,
                fontSize: labelFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
