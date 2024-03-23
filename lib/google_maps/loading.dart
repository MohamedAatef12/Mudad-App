import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
    required this.isLoading,
  });
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ModalProgressHUD(
        opacity: 0.5,
        color: Colors.black,
        inAsyncCall: isLoading,
        progressIndicator: const SpinKitFadingCircle(
          color: Color(0xFF609FD8),
          size: 50.0,
        ),
        child: const SizedBox.shrink(),
      ),
    );
  }
}
