import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  ProfileAvatar(this.didTakePicture, this.imageBytes);
  final bool didTakePicture;
  final Uint8List? imageBytes;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(2, 2.5), // changes position of shadow
          ),
        ],
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(50),
      ),
      child: CircleAvatar(
        radius: 48,
        backgroundColor:
            didTakePicture ? Colors.grey.shade900 : Colors.grey.shade400,
        backgroundImage: didTakePicture ? MemoryImage(imageBytes!) : null,
        child: didTakePicture
            ? null
            : Icon(
                Icons.camera_alt_rounded,
                size: 30,
                color: Colors.purple.shade800,
              ),
      ),
    );
  }
}
