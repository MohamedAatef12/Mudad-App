import 'package:flutter/material.dart';

class BuildChooseOrphanageButton extends StatelessWidget {
  const BuildChooseOrphanageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 120,
      left: 120,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(const Size(20, 60)),
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFF609FD8),
            ),
          ),
          onPressed: () {},
          child: const Text(
            "اخـتـيـار",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
