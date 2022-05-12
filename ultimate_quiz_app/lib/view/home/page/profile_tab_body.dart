import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/auth_provider.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_avatar.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_rank_widget.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_username.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/rank_system_dialog.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/select_image_dialog.dart';
import 'package:ultimate_quiz_app/widgets/loader_dialog.dart';
import 'package:ultimate_quiz_app/widgets/quiz_dialog.dart';

class ProfileTabBody extends StatefulWidget {
  @override
  State<ProfileTabBody> createState() => _ProfileTabBodyState();
}

class _ProfileTabBodyState extends State<ProfileTabBody> {
  bool didTakePicture = false;

  bool test = false;

  Uint8List? imageBytes;

  void selectImage(AuthProvider authProvider, bool isCamera) async {
    //Navigator.pop(context);
    final ImagePicker _picker = ImagePicker();
    final XFile? file = await _picker.pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    //showImagePickerDialog(context, authProvider);
    if (file != null) {
      Navigator.pop(context);
      try {
        Future<void>(() {
          showLoaderDialogWithText(context, text: 'Učitavanje...');
        });
        await authProvider.uploadProfileImage(file.path).whenComplete(() => Navigator.pop(context));
        setState(() {
          didTakePicture = true;
        });
      } on FirebaseException catch (error) {
        showErrorDialog(context, error: error.message!);
      }
    }
  }

  @override
  void initState() {
    if (test == false) {
      //print('x');
      setState(() {
        test = true;
      });
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //print('xxx');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        children: [
          Container(
            // PROFILE CARD WITH RANK
            decoration: _profileBoxDecoration(),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  //onTap: () => selectImage(authProvider, context,),
                  onTap: () => showImagePickerDialog(context, authProvider, selectImage),
                  child: ProfileAvatar(didTakePicture, imageBytes, isInTestPhase: true),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileUsername('@${authProvider.userProfile?.username}'),
                        GestureDetector(
                          onTap: () => showRankSystem(context),
                          child: ProfileRankWidget(rank: 'platinum', rankLevel: '1'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), // END
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Column(
              children: [
                _statRowWidget(title: 'Broj igara:', stat: '1024 🎲'),
                _statRowWidget(stat: '123 🏆', title: 'Broj pobjeda:'),
                _statRowWidget(title: 'Procenat pobjeda:', stat: '57/💯'),
                _statRowWidget(title: 'Broj vezanih pobjeda:', stat: '7 🔥'),
                _statRowWidget(title: 'Favorit kategorija:', stat: 'Filmovi 🎬'),
              ],
            ),
          ),
          const Divider(
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
      border: Border.all(color: Colors.white, width: 0.6),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.blue.shade900,
          blurRadius: 5,
          spreadRadius: 1,
          offset: Offset(0, 0),
        )
      ],
      gradient: LinearGradient(colors: [
        Colors.pink.shade900,
        Colors.blue.shade900,
      ]),
    );
  }

  Widget _statTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.w400,
          ),
    );
  }

  Widget _actualStat(String stat, [bool changeFont = false]) {
    return Row(
      children: [
        Text(
          stat,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: changeFont ? 18 : 20,
                fontFamily: changeFont ? 'Viga' : 'Acme',
              ),
        ),
      ],
    );
  }

  Widget _statRowWidget({required String title, required String stat}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _statTitle(title),
          Row(
            children: [
              if (title == 'Favorit kategorija:') _actualStat(stat, true) else _actualStat(stat),
              // Icon(
              //   Icons.accessibility_sharp,
              //   color: Colors.yellow.shade700,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

void showRankSystem(BuildContext ctx) {
  showDialog(context: ctx, barrierDismissible: true, builder: (context) => RankSystemDialog());
}
