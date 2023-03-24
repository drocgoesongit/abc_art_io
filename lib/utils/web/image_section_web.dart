import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSectionWeb extends StatefulWidget {
  const ImageSectionWeb({super.key});

  @override
  State<ImageSectionWeb> createState() => _ImageSectionWebState();
}

class _ImageSectionWebState extends State<ImageSectionWeb> {
  Uint8List? _pickedImage = Uint8List(8);

  // Get image function
  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      setState(() {
        _pickedImage = f;
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Image.memory(_pickedImage!, fit: BoxFit.fill),
        ),
        ElevatedButton(
          onPressed: () {
            getImage();
          },
          child: const Text('Pick Image'),
        ),
      ],
    );
  }
}
