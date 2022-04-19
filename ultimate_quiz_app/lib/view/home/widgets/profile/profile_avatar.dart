import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/auth_provider.dart';

class ProfileAvatar extends StatelessWidget {
  ProfileAvatar(this.didTakePicture, this.imageBytes,
      {this.isInTestPhase = false});
  final bool didTakePicture;
  final Uint8List? imageBytes;
  final bool isInTestPhase;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      // final AuthProvider authProvider =
      //     Provider.of<AuthProvider>(context, listen: false);
      final String? profileImageURL = provider.userProfile?.imageURL;
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
        child: profileImageURL != null && profileImageURL.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl: profileImageURL,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    errorWidget:
                        (BuildContext context, String value, dynamic error) =>
                            CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      child: Icon(
                        Icons.error,
                        size: 30,
                        color: Colors.purple.shade800,
                      ),
                      radius: 48,
                    ),
                    placeholder: (context, url) => Image.asset(
                      'assets/images/strucnjak.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )

            // ? CircleAvatar(
            //     radius: 48,
            //     backgroundImage: CachedNetworkImageProvider(
            //       profileImageURL,

            //     ),
            //   )
            // ? CircleAvatar(
            //     child: SizedBox(
            //       width: 50,
            //       height: 50,
            //       child : ClipRRect(
            //         borderRadius: BorderRadius.circular(1000),
            //         child: CachedNetworkImage(
            //           imageUrl: profileImageURL,
            //           fit: BoxFit.cover,
            //           filterQuality: FilterQuality.high,
            //           errorWidget:
            //               (BuildContext context, String value, dynamic error) =>
            //                   CircleAvatar(
            //             backgroundColor: Colors.grey.shade400,
            //             child: Icon(
            //               Icons.camera_alt_rounded,
            //               size: 30,
            //               color: Colors.purple.shade800,
            //             ),
            //             radius: 48,

            //           ),
            //           placeholder: (context, url) =>
            //               Image.asset('assets/images/strucnjak.png'),
            //         ),
            //       ),
            //     ),
            //     radius: 48,
            //   )
            : CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                child: Icon(
                  Icons.camera_alt_rounded,
                  size: 30,
                  color: Colors.purple.shade800,
                ),
                radius: 48,
              ),
        // child: CircleAvatar(
        //   radius: 48,
        //   backgroundColor:
        //       profileImageURL!.isNotEmpty ? Colors.grey.shade900 : Colors.grey.shade400,
        //   backgroundImage: CachedNetworkImage(imageUrl: profileImageURL!, placeholder: Image.asset('assets/images/strucnjak.png'),), // didTakePicture ? MemoryImage(imageBytes!) : null,
        //   child: isInTestPhase
        //       ? null
        //       : didTakePicture
        //           ? null
        //           : Icon(
        //               Icons.camera_alt_rounded,
        //               size: 30,
        //               color: Colors.purple.shade800,
        //             ),
        // ),
      );
    });
  }
}
