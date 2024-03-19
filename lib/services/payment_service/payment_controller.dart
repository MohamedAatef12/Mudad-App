import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:mudad_app/google_maps/mosque_map/build_product.dart';

class PaymentController{
  PaymentSdkConfigurationDetails generateConfig() {
    var billingDetails = BillingDetails("Test", "test@gmail.com",
        "+01067863914", "Cairo", "eg", "dubai", "dubai", "12345");
    var shippingDetails = ShippingDetails("Test", "test@gmail.com",
        "+01067863914", "Cairo", "eg", "dubai", "dubai", "12345");
    List<PaymentSdkAPms> apms = [];
    apms.add(PaymentSdkAPms.AMAN);
    final configuration = PaymentSdkConfigurationDetails(
        profileId: "109491",
        locale: PaymentSdkLocale.AR,
        serverKey: "SNJNHRDJBZ-JHWWTRZK6T-RHH2JW2RKZ",
        clientKey: "CKKM9H-NHG26H-VV7R9K-6BMMTP",
        cartId: "56421",
        cartDescription: "Flowers",
        merchantName: "مؤسسة مدد الفتح التجارية",
        screentTitle: "Pay with Card",
        amount: totalOrder.toDouble(),
        showBillingInfo: true,
        forceShippingInfo: false,
        currencyCode: "SAR",
        merchantCountryCode: "SA",
        billingDetails: billingDetails,
        shippingDetails: shippingDetails,
        alternativePaymentMethods: apms,
        linkBillingNameWithCardHolderName: false);
    final theme = IOSThemeConfigurations();
    theme.logoImage = "assets/logo.png";
    configuration.iOSThemeConfigurations = theme;
    configuration.tokeniseType = PaymentSdkTokeniseType.NONE;
    // configuration.cardDiscounts = [
    //   PaymentSDKCardDiscount(
    //       discountCards: ["4111"],
    //       discountValue: 50,
    //       discountTitle: "50% discount on cards starting with 4111",
    //       isPercentage: true),
    //   PaymentSDKCardDiscount(
    //       discountCards: ["4000", "41111"],
    //       discountValue: 2,
    //       discountTitle: "2 discount on cards starting with 4000 and 41111",
    //       isPercentage: false)
    // ];
    return configuration;
  }


  Future<void> payPressed() async {
    FlutterPaytabsBridge.startCardPayment(generateConfig(), (event) {
      print(event.toString());
      // setState(() {
        if (event["status"] == "success") {
          // Handle transaction details here.
          var transactionDetails = event["data"];
          print(transactionDetails);
          if (transactionDetails["isSuccess"]) {
            print("successful transaction");
            if (transactionDetails["isPending"]) {
              print("transaction pending");
            }
          } else {
            print("failed transaction");
          }

          // print(transactionDetails["isSuccess"]);
        } else if (event["status"] == "error") {
          print("error");
          // Handle error here.
        } else if (event["status"] == "event") {
          print("event");
          // Handle events here.
        }
      });
    // });
  }
//
// Future<void> payWithTokenPressed() async {
//   FlutterPaytabsBridge.startTokenizedCardPayment(
//       generateConfig(), "*Token*", "*TransactionReference*", (event) {
//     setState(() {
//       if (event["status"] == "success") {
//         // Handle transaction details here.
//         var transactionDetails = event["data"];
//         print(transactionDetails);
//         if (transactionDetails["isSuccess"]) {
//           print("successful transaction");
//           if (transactionDetails["isPending"]) {
//             print("transaction pending");
//           }
//         } else {
//           print("failed transaction");
//         }
//
//         // print(transactionDetails["isSuccess"]);
//       } else if (event["status"] == "error") {
//         // Handle error here.
//       } else if (event["status"] == "event") {
//         // Handle events here.
//       }
//     });
//   });
// }
//
// Future<void> payWith3ds() async {
//   FlutterPaytabsBridge.start3DSecureTokenizedCardPayment(
//       generateConfig(),
//       PaymentSDKSavedCardInfo("4111 11## #### 1111", "visa"),
//       "*Token*", (event) {
//     setState(() {
//       if (event["status"] == "success") {
//         // Handle transaction details here.
//         var transactionDetails = event["data"];
//         print(transactionDetails);
//         if (transactionDetails["isSuccess"]) {
//           print("successful transaction");
//           if (transactionDetails["isPending"]) {
//             print("transaction pending");
//           }
//         } else {
//           print("failed transaction");
//         }
//
//         // print(transactionDetails["isSuccess"]);
//       } else if (event["status"] == "error") {
//         // Handle error here.
//       } else if (event["status"] == "event") {
//         // Handle events here.
//       }
//     });
//   });
// }
//
// Future<void> payWithSavedCards() async {
//   FlutterPaytabsBridge.startPaymentWithSavedCards(generateConfig(), false,
//       (event) {
//     setState(() {
//       if (event["status"] == "success") {
//         // Handle transaction details here.
//         var transactionDetails = event["data"];
//         print(transactionDetails);
//         if (transactionDetails["isSuccess"]) {
//           print("successful transaction");
//           if (transactionDetails["isPending"]) {
//             print("transaction pending");
//           }
//         } else {
//           print("failed transaction");
//         }
//
//         // print(transactionDetails["isSuccess"]);
//       } else if (event["status"] == "error") {
//         // Handle error here.
//       } else if (event["status"] == "event") {
//         // Handle events here.
//       }
//     });
//   });
// }
//
// Future<void> apmsPayPressed() async {
//   FlutterPaytabsBridge.startAlternativePaymentMethod(generateConfig(),
//       (event) {
//     setState(() {
//       if (event["status"] == "success") {
//         // Handle transaction details here.
//         var transactionDetails = event["data"];
//         print(transactionDetails);
//       } else if (event["status"] == "error") {
//         // Handle error here.
//       } else if (event["status"] == "event") {
//         // Handle events here.
//       }
//     });
//   });
// }

// Future<void> queryPressed() async {
//   FlutterPaytabsBridge.queryTransaction(
//       generateConfig(), generateQueryConfig(), (event) {
//     setState(() {
//       if (event["status"] == "success") {
//         // Handle transaction details here.
//         var transactionDetails = event["data"];
//         print(transactionDetails);
//       } else if (event["status"] == "error") {
//         // Handle error here.
//       } else if (event["status"] == "event") {
//         // Handle events here.
//       }
//     });
//   });
// }

// Future<void> applePayPressed() async {
//   var configuration = PaymentSdkConfigurationDetails(
//       profileId: "*Profile id*",
//       serverKey: "*server key*",
//       clientKey: "*client key*",
//       cartId: "12433",
//       cartDescription: "Flowers",
//       merchantName: "Flowers Store",
//       amount: 20.0,
//       currencyCode: "AED",
//       merchantCountryCode: "ae",
//       merchantApplePayIndentifier: "merchant.com.bunldeId",
//       simplifyApplePayValidation: true);
//   FlutterPaytabsBridge.startApplePayPayment(configuration, (event) {
//     setState(() {
//       if (event["status"] == "success") {
//         // Handle transaction details here.
//         var transactionDetails = event["data"];
//         print(transactionDetails);
//       } else if (event["status"] == "error") {
//         // Handle error here.
//       } else if (event["status"] == "event") {
//         // Handle events here.
//       }
//     });
//   });
// }

// Widget applePayButton() {
//   if (Platform.isIOS) {
//     return TextButton(
//       onPressed: () {
//         applePayPressed();
//       },
//       child: Text('Pay with Apple Pay'),
//     );
//   }
//   return SizedBox(height: 0);
// }
}