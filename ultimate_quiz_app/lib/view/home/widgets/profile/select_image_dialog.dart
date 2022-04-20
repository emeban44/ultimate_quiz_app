import 'package:flutter/material.dart';

class SelectImageDialog extends StatelessWidget {
  const SelectImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('ODABERI IZ GALERIJE')),
          ElevatedButton(
            onPressed: () {},
            child: Text('USLIKAJ SE'),
          ),
        ],
      ),
    );
  }
}

void showImagePickerDialog(BuildContext context,
    {bool isBarrierDismissible = true}) {
  showDialog(
      context: context,
      barrierDismissible: isBarrierDismissible,
      builder: (context) {
        return SelectImageDialog();
      });
}
