import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio/const/constants.dart';

import '../../utils/create_art_subtitle_row.dart';

class CreateArtWeb extends StatefulWidget {
  const CreateArtWeb({super.key});

  @override
  State<CreateArtWeb> createState() => _CreateArtWebState();
}

class _CreateArtWebState extends State<CreateArtWeb> {
  Uint8List? _pickedImage;
  bool _isImageSelected = false;
  bool _uploadSuccess = false;
  String uploadUrl = "Getting URL...";
  String description = "...";
  String gender = "male";
  String imageTheme = "";
  String style = "";
  String photoStyle = "";
  double randomness = 0;

  int _selectedIndexGender = 0;
  int _selectedIndexTheme = 0;
  int _selectedIndexStyle = 0;
  int _selectedIndexPhotoStyle = 0;

  final List<String> genderList = ["Male", "Female", "Can't say"];
  final List<String> themeList = [
    "sci-fi",
    "portrait",
    "landscape",
    "abstract"
  ];
  final List<String> styleList = ["Realistic", "Cartoon", "Anime"];
  final List<String> photoStyleList = ["Cinematic", "Photorealistic", "8K"];

  List<Widget> choiceChipsGender() {
    List<Widget> chips = [];
    for (int i = 0; i < genderList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: kMainAccentColor, width: 1.0),
          ),
          label: Text(genderList[i]),
          labelStyle:
              const TextStyle(fontFamily: "Montserrat", color: Colors.black),
          backgroundColor: _selectedIndexGender == i
              ? kSubtleAccentColor
              : Colors.transparent,
          selected: _selectedIndexGender == i,
          selectedColor: kSubtleAccentColor,
          onSelected: (bool value) {
            setState(() {
              _selectedIndexGender = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> choiceChipsTheme() {
    List<Widget> chips = [];
    for (int i = 0; i < themeList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: kMainAccentColor, width: 1.0),
          ),
          label: Text(themeList[i]),
          labelStyle:
              const TextStyle(fontFamily: "Montserrat", color: Colors.black),
          backgroundColor: _selectedIndexTheme == i
              ? kSubtleAccentColor
              : Colors.transparent,
          selected: _selectedIndexTheme == i,
          selectedColor: kSubtleAccentColor,
          onSelected: (bool value) {
            setState(() {
              _selectedIndexTheme = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> choiceChipsBackgroundStyle() {
    List<Widget> chips = [];
    for (int i = 0; i < styleList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: kMainAccentColor, width: 1.0),
          ),
          label: Text(styleList[i]),
          labelStyle:
              const TextStyle(fontFamily: "Montserrat", color: Colors.black),
          backgroundColor: _selectedIndexStyle == i
              ? kSubtleAccentColor
              : Colors.transparent,
          selected: _selectedIndexStyle == i,
          selectedColor: kSubtleAccentColor,
          onSelected: (bool value) {
            setState(() {
              _selectedIndexStyle = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> choiceChipsPhotoStyle() {
    List<Widget> chips = [];
    for (int i = 0; i < photoStyleList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: kMainAccentColor, width: 1.0),
          ),
          label: Text(photoStyleList[i]),
          labelStyle:
              const TextStyle(fontFamily: "Montserrat", color: Colors.black),
          backgroundColor: _selectedIndexPhotoStyle == i
              ? kSubtleAccentColor
              : Colors.transparent,
          selected: _selectedIndexPhotoStyle == i,
          selectedColor: kSubtleAccentColor,
          onSelected: (bool value) {
            setState(() {
              _selectedIndexPhotoStyle = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                  color: kBackgroundSubtleTealColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Customize properties",
                              style: kTitleCreateArt,
                            ),
                            SizedBox(height: height / 80),
                            // outlined container
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: kMainAccentColor, width: 1),
                              ),
                              child: const Text(
                                  "You can set custom factors like theme, style, randomness, etc. Your final image will be generated based on these factors."),
                            ),
                            SizedBox(height: height / 40),
                            // chip to select
                            const SubtitleRow(
                              title: "Gender",
                              icon: "assets/images/gender_icon.svg",
                              isOptional: true,
                            ),
                            Container(
                                height: 60,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: choiceChipsGender(),
                                )),
                            SizedBox(height: height / 40),
                            // chip to select
                            const SubtitleRow(
                              title: "Theme",
                              icon: "assets/images/theme_icon.svg",
                              isOptional: true,
                            ),

                            Container(
                                height: 60,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: choiceChipsTheme(),
                                )),
                            SizedBox(height: height / 40),
                            // chip to select
                            const SubtitleRow(
                              title: "Background style",
                              icon: "assets/images/background_icon.svg",
                              isOptional: true,
                            ),
                            Container(
                                height: 60,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: choiceChipsBackgroundStyle(),
                                )),
                            SizedBox(height: height / 40),
                            // chip to select
                            const SubtitleRow(
                              title: "Randomness",
                              icon: "assets/images/random_icon.svg",
                              isOptional: true,
                            ),

                            Slider(
                              value: randomness,
                              min: 0,
                              max: 100,
                              divisions: 100,
                              label: randomness.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  randomness = value;
                                });
                              },
                            ),

                            SizedBox(height: height / 40),
                            // chip to select
                            const SubtitleRow(
                              title: "Photo style",
                              icon: "assets/images/camera_icon.svg",
                              isOptional: true,
                            ),
                            SizedBox(height: height / 40),

                            Container(
                                height: 60,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: choiceChipsPhotoStyle(),
                                )),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                                  borderRadius:
                                      BorderRadius.circular(height / 15),
                                ),
                                child: _isImageSelected
                                    ? Image.memory(_pickedImage!,
                                        fit: BoxFit.fill)
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
                                borderRadius:
                                    BorderRadius.circular(height / 10),
                                border: Border.all(
                                    color: Colors.white, width: height / 80),
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
                            side: const BorderSide(
                                color: kMainAccentColor, width: 1)),
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
                                Text(
                                    _isImageSelected
                                        ? "Change Image"
                                        : "Select Image",
                                    style: kTextBlack20.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
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
                            side: const BorderSide(
                                color: kMainAccentColor, width: 1)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Generate image",
                                    style: kTextBlack20.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                SizedBox(width: height / 80),
                                const Icon(Icons.arrow_forward_rounded),
                              ],
                            )),
                      ),
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
