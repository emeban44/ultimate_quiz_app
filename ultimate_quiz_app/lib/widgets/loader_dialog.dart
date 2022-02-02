import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        size: 120,
        itemBuilder: (context, index) =>
            Image.asset('assets/images/higlogo.png'),
      ),
    );
  }
}
