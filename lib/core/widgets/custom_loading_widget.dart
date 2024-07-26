import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Define a constant for the loading spinner
const spinkit = SpinKitFadingCircle(
  color: Colors.black,
  size: 50.0,
  duration: Duration(milliseconds: 1200),
);

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return const Center(child: spinkit);
  }
}
