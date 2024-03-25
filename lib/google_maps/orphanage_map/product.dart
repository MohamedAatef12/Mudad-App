// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     Key? key,
//     required this.imagePath,
//     required this.productName,
//     required this.productDetails,
//     required this.price,
//   }) : super(key: key);
//
//   final String imagePath;
//   final String productName;
//   final String productDetails;
//   final int price;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 175,
//       child: Card(
//         elevation: 1,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         color: Colors.white,
//         margin: const EdgeInsets.all(0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 5,
//             ),
//             Image.asset(
//               imagePath,
//               height: 70,
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             FittedBox(
//               child: Text(
//                 productName,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             FittedBox(
//               child: Text(
//                 productDetails,
//                 style: const TextStyle(
//                   color: Colors.blue,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 13,
//             ),
//             SizedBox(
//               height: 37,
//               width: 130,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all<EdgeInsets>(
//                     const EdgeInsets.all(0),
//                   ),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   minimumSize: MaterialStateProperty.all<Size>(
//                     const Size(20, 60),
//                   ),
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                     const Color(0xFF609FD8),
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: Center(
//                   child: Row(
//                     children: [
//                       Text(
//                         "   riyal ".tr,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         '$price ',
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
