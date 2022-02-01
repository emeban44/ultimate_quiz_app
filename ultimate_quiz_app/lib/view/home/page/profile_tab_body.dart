import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_avatar.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_rank_widget.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_username.dart';

class ProfileTabBody extends StatefulWidget {
  @override
  State<ProfileTabBody> createState() => _ProfileTabBodyState();
}

class _ProfileTabBodyState extends State<ProfileTabBody> {
  bool didTakePicture = false;

  Uint8List? imageBytes;

  void selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      final Uint8List bytes = await file.readAsBytes();
      setState(() {
        didTakePicture = true;
        imageBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        children: [
          Container(
            decoration: _profileBoxDecoration(),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: selectImage,
                  child: ProfileAvatar(didTakePicture, imageBytes),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileUsername('@biom237'),
                        ProfileRankWidget(rank: 'gold', numberOfGames: '5'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: Container(color: Colors.white12),
          // )
        ],
      ),
    );
  }

  BoxDecoration _profileBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.white, width: 0.4),
      gradient: LinearGradient(colors: [
        Colors.pink.shade900,
        Colors.blue.shade900,
      ]),
    );
  }
}
