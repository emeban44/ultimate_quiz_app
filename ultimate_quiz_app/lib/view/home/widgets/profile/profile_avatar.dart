import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  ProfileAvatar(this.didTakePicture, this.imageBytes,
      {this.isInTestPhase = false});
  final bool didTakePicture;
  final Uint8List? imageBytes;
  final bool isInTestPhase;
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
        backgroundImage: NetworkImage(
            'https://m.media-amazon.com/images/M/MV5BMjI2NTE1MjY5OF5BMl5BanBnXkFtZTgwMzQ3OTIwMjE@._V1_.jpg'), // didTakePicture ? MemoryImage(imageBytes!) : null,
        child: isInTestPhase
            ? null
            : didTakePicture
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
