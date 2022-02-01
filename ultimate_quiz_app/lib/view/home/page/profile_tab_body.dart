import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_avatar.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_rank_widget.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_username.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/rank_system_dialog.dart';
import 'package:ultimate_quiz_app/widgets/quiz_dialog.dart';

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

  void showRankSystem(BuildContext ctx) {
    showDialog(
        context: ctx,
        barrierDismissible: true,
        builder: (context) => RankSystemDialog());
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
                        GestureDetector(
                          onTap: () => showRankSystem(context),
                          child: ProfileRankWidget(
                              rank: 'panj', numberOfGames: '5'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Broj pobjeda:',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    Row(
                      children: [
                        Text(
                          '123🏆',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 30),
                        ),
                        // Icon(
                        //   Icons.accessibility_sharp,
                        //   color: Colors.yellow.shade700,
                        // ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Broj vezanih pobjeda:',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    Row(
                      children: [
                        Text(
                          '7🔥',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 30),
                        ),
                        // Icon(
                        //   Icons.fireplace_outlined,
                        //   color: Colors.orange,
                        // ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Favorit kategorija:',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    Row(
                      children: [
                        Text(
                          'Sport🎾',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 30),
                        ),
                        // Icon(
                        //   Icons.sports_baseball_rounded,
                        //   color: Colors.yellow,
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 0.7,
          ),
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
