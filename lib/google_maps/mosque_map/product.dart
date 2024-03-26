import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.productDetails,
    required this.price,
    required this.quantityCounter,
    required this.addition,
    required this.remove,
  }) : super(key: key);

  final String imagePath;
  final String productName;
  final String productDetails;
  final int price, quantityCounter;
  final void Function()? addition, remove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.422,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        color: Colors.white,
        margin: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            Image.network(
              imagePath,
              height: 70,
            ),
            FittedBox(
              child: Text(
                productName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: addition,
                  icon: const Icon(Icons.add),
                  color: Colors.green,
                ),
                Text(quantityCounter.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                IconButton(
                  onPressed: remove,
                  icon: const Icon(Icons.remove),
                  color: Colors.red,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.33,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(0),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(
                      MediaQuery.of(context).size.height * 0.04,
                      MediaQuery.of(context).size.width * 0.33,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF609FD8),
                  ),
                ),
                onPressed: () {},
                child: FittedBox(
                  child: Text(
                    '${"   riyal ".tr} $price',
                    style: GoogleFonts.lalezar(
                      fontSize: 24,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
