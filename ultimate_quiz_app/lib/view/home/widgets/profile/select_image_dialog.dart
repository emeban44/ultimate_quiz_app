import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/auth_provider.dart';

class SelectImageDialog extends StatelessWidget {
  const SelectImageDialog(this.ctx, this.selectImage, {Key? key})
      : super(key: key);
  final BuildContext ctx;
  final Function(AuthProvider, bool) selectImage;
  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          //onTap: () => selectImageFrom(false, context, ctx, authProvider),
          onTap: () => selectImage(authProvider, false),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 0.75),
              gradient: LinearGradient(
                colors: [Colors.blue.shade900, Colors.pink.shade900],
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'ODABERI IZ GALERIJE',
                  style: TextStyle(
                    fontSize: 19,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Acme',
                  ),
                ),
                SizedBox(width: 7.5),
                Icon(Icons.photo),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12.5),
        GestureDetector(
          //onTap: () => selectImageFrom(true, context, ctx, authProvider),
          onTap: () => selectImage(authProvider, true),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 0.75),
              gradient: LinearGradient(
                colors: [Colors.blue.shade900, Colors.pink.shade900],
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'USLIKAJ SE',
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'Acme',
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 7.5),
                Icon(Icons.camera_alt),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Future<void> selectImageFrom(bool isCamera, BuildContext context,
//     BuildContext ctx, AuthProvider authProvider) async {
//   Navigator.pop(ctx);
//   final ImagePicker _picker = ImagePicker();
//   final XFile? file = await _picker.pickImage(
//       source: isCamera ? ImageSource.camera : ImageSource.gallery);

//   if (file != null) {
//     try {
//       Future<void>(() {
//         showLoaderDialogWithText(ctx, text: 'Učitavanje...');
//       });
//       await authProvider
//           .uploadProfileImage(file.path)
//           .whenComplete(() => Navigator.pop(ctx));
//       // setState(() {
//       //   didTakePicture = true;
//       // });
//     } on FirebaseException catch (error) {
//       showErrorDialog(context, error: error.message!);
//     }
//   }
// }

Future<void> showImagePickerDialog(BuildContext context,
    AuthProvider authProvider, Function(AuthProvider, bool) selectImage,
    {bool isBarrierDismissible = true}) async {
  await showDialog(
      context: context,
      barrierDismissible: isBarrierDismissible,
      builder: (context) {
        return SelectImageDialog(context, selectImage);
      });
}
