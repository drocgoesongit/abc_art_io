import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio/const/constants.dart';

class CreateArtWithPromptMobile extends StatefulWidget {
  const CreateArtWithPromptMobile({super.key});

  @override
  State<CreateArtWithPromptMobile> createState() =>
      _CreateArtWithPromptMobileState();
}

class _CreateArtWithPromptMobileState extends State<CreateArtWithPromptMobile> {
  Uint8List? _pickedImage;
  bool _isImageSelected = false;
  bool _uploadSuccess = false;
  String uploadUrl = "Getting URL...";

  // Get image function
  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      setState(() {
        _pickedImage = f;
        _isImageSelected = true;
      });
    } else {
      print('No image selected.');
    }
  }

  Future<String> uploadFile(Uint8List file, BuildContext context) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("version1/${DateTime.now()}.png");

      // Upload the file to Firebase Storage
      UploadTask uploadTask = ref.putData(file);

      // Wait for the upload to complete
      await uploadTask;

      // Get the download URL of the uploaded file
      String downloadURL = await ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          duration: Duration(seconds: 3),
        ),
      );
      return "Error";
    }
    // Create a reference to the Firebase Storage location
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Material(
      color: kBackgroundSubtleTealColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            child: Center(
                child: Row(
              children: [
                const Text("abc.art", style: kTitleTextBlackMobile),
                Expanded(child: Container()),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                )
              ],
            )),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: height / 20),
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 80),
                      child: Container(
                        height: height / 3 - height / 40,
                        width: height / 3 - height / 40,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(height / 15),
                        ),
                        child: _isImageSelected
                            ? Image.memory(_pickedImage!, fit: BoxFit.fill)
                            : const Center(
                                child: Text(
                                  'No Image Selected',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: height / 3,
                      width: height / 3,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(height / 10),
                        border:
                            Border.all(color: Colors.white, width: height / 80),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 40),
              MaterialButton(
                elevation: 5.0,
                onPressed: () {
                  getImage();
                },
                color: kBackgroundSubtleTealColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: const BorderSide(color: kMainAccentColor, width: 1)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _isImageSelected
                            ? Icon(Icons.change_circle)
                            : Icon(Icons.add_a_photo),
                        SizedBox(width: height / 80),
                        Text(_isImageSelected ? "Change Image" : "Select Image",
                            style: kTextBlack20.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    )),
              ),
              SizedBox(height: height / 80),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "Caution",
                  style: kTextBlack20.copyWith(fontSize: 14.0),
                ),
              ),
              SizedBox(
                height: height / 30,
                width: double.infinity,
              ),
              Container(
                width: double.infinity,
                child: Text("Description/Prompt",
                    style: kBoldTextStyle.copyWith(fontSize: 18.0)),
              ),
              SizedBox(height: height / 80),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                height: height / 4.5,
                decoration: BoxDecoration(
                  color: kBackgroundSubtleTealColor,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: kMainAccentColor, width: 1),
                ),
                child: TextField(
                  style: kTextBlack20.copyWith(
                    fontSize: 14.0,
                  ),
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter description/prompt here",
                    hintStyle: kTextBlack20.copyWith(
                      fontSize: 14.0,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              Container(
                width: height / 40,
                height: height / 40,
                color: _uploadSuccess ? Colors.green : Colors.red,
                child: Text(uploadUrl,
                    style: kTextBlack20.copyWith(fontSize: 14.0)),
              ),
              MaterialButton(
                elevation: 5.0,
                onPressed: () async {
                  // Send request.
                  if (_pickedImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select an image'),
                      ),
                    );
                    return;
                  } else {
                    String downloadUrl =
                        await uploadFile(_pickedImage!, context);
                    setState(() {
                      uploadUrl = downloadUrl;
                      _uploadSuccess = true;
                    });
                  }
                },
                color: kMainAccentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: const BorderSide(color: kMainAccentColor, width: 1)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Generate image",
                            style: kTextBlack20.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(width: height / 80),
                        const Icon(Icons.arrow_forward_rounded),
                      ],
                    )),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
