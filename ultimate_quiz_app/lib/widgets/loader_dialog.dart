import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        //color: Colors.pink,
        size: 150,
        itemBuilder: (context, index) =>
            Image.asset('assets/images/higlogo.png'),
      ),
      // child: SpinKitSquareCircle(
      //   //color: Colors.blue,
      //   itemBuilder: (context, index) {
      //     if (index == 0) {
      //       return Container(
      //         child: Image.asset("assets/images/higlogo.png"),
      //       );
      //     } else {
      //       return Icon(
      //         Icons.hourglass_bottom,
      //         size: 100,
      //       );
      //     }
      //   },
      //   size: 100,
      // ),
    );
  }
}
