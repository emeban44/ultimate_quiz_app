import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTabBody extends StatefulWidget {
  @override
  State<ProfileTabBody> createState() => _ProfileTabBodyState();
}

class _ProfileTabBodyState extends State<ProfileTabBody> {
  bool didTakePicture = false;
  String filePath = '';
  //Uint8List memoryPath
  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        children: [
          Container(
            //color: Colors.blue,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(12),
            //   border: Border.all(color: Colors.white, width: 0.3),
            //   gradient: LinearGradient(colors: [
            //     Colors.pink.shade900,
            //     Colors.blue.shade900,
            //   ]),
            // ),
            padding: const EdgeInsets.all(10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? file =
                        await _picker.pickImage(source: ImageSource.camera);

                    if (file != null) {
                      final Uint8List bytes = await file.readAsBytes();
                      setState(() {
                        didTakePicture = true;
                        imageBytes = bytes;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0.75),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor:
                          didTakePicture ? Colors.grey.shade900 : Colors.grey,
                      backgroundImage:
                          didTakePicture ? MemoryImage(imageBytes!) : null,
                      child: didTakePicture
                          ? null
                          : Icon(
                              Icons.camera_alt_rounded,
                              size: 30,
                            ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.white, width: 0.3),
                                gradient: LinearGradient(colors: [
                                  Colors.pink.shade900,
                                  Colors.blue.shade900,
                                ]),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11,
                                vertical: 6.6,
                              ),
                              child: Text(
                                '@emeban',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Acme',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 7.5),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        // Colors.green.shade100,
                                        // Colors.green.shade300,
                                        // Colors.teal,
                                        // Colors.teal.shade900,
                                        // Colors.orange.shade100,
                                        // Colors.orange.shade200,
                                        // Colors.orange.withOpacity(0.75),
                                        // Colors.orange.shade800.withOpacity(0.5),

                                        Colors.grey.shade700,
                                        Colors.grey.shade500,
                                        Colors.grey.shade300,
                                        Colors.grey.shade200,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.white, width: 0.5)),
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            child: Image.asset(
                                              "assets/images/silver.png",
                                              // "assets"
                                              //height: 20,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0, top: 2),
                                            child: Text(
                                              'SILVER',
                                              style: TextStyle(
                                                color: Colors.blueGrey.shade800
                                                    .withOpacity(1),
                                                fontFamily: 'Acme',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 7.5),
                                        child: Text(
                                          '0 igara',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Acme',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
}
