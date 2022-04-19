import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({Key? key}) : super(key: key);

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

void showLoaderDialog(BuildContext context,
    {bool isBarrierDismissible = false}) {
  showDialog(
      context: context,
      barrierDismissible: isBarrierDismissible,
      builder: (context) {
        return const LoaderDialog();
      });
}

void showLoaderDialogWithText(BuildContext context,
    {bool isBarrierDismissible = false, required String text}) {
  showDialog(
      context: context,
      barrierDismissible: isBarrierDismissible,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoaderDialog(),
            Text(
              text,
              style: const TextStyle(fontFamily: 'Signika', fontSize: 17.5),
            ),
          ],
        );
      });
}
