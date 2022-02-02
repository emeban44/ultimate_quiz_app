import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StartGameLoaderDialog extends StatelessWidget {
  StartGameLoaderDialog(this.loadingText);
  final String loadingText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 83.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCircle(
            size: 120,
            itemBuilder: (context, index) =>
                Image.asset('assets/images/higlogo.png'),
          ),
          Text(
            loadingText,
            style: const TextStyle(
              inherit: false,
            ),
          ),
        ],
      ),
    );
  }
}

void showStartGameDialog(BuildContext context, String loadingText) {
  showDialog(
      context: context,
      builder: (context) {
        return StartGameLoaderDialog(loadingText);
      });
}
