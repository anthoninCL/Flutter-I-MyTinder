import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_tinder/models/profile.dart';
import 'package:my_tinder/views/profile_edit/widgets/picture_selector.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class PictureSelectorList extends StatefulWidget {
  PictureSelectorList({Key? key, required this.profile}) : super(key: key);

  ValueNotifier<ProfileModel?> profile;

  @override
  _PictureSelectorListState createState() => _PictureSelectorListState();
}

class _PictureSelectorListState extends State<PictureSelectorList> {
  final ImagePicker _picker = ImagePicker();

  bool checkIfTileActive(index) {
    return widget.profile.value!.images.length >= index;
  }

  void showPicker(context, index) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: widget.profile.value!.images.length == index
                  ? Wrap(
                      children: <Widget>[
                        ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Photo Library'),
                            onTap: () {
                              imgFromGallery();
                              Navigator.of(context).pop();
                            }),
                        ListTile(
                          leading: const Icon(Icons.photo_camera),
                          title: const Text('Camera'),
                          onTap: () {
                            imgFromCamera();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )
                  : Wrap(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.delete),
                          title: const Text('Delete'),
                          onTap: () {
                            deleteImg(index);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ));
        });
  }

  deleteImg(index) async {
    SharedPreferences s = await SharedPreferences.getInstance();
    var profile = ProfileModel.from(widget.profile.value!);

    profile.images.removeAt(index);

    widget.profile.value = profile;
    s.setStringList("images", widget.profile.value!.images);
  }

  imgFromCamera() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    var profile = ProfileModel.from(widget.profile.value!);

    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      profile.images.add(image.path);
      widget.profile.value = profile;
      s.setStringList("images", widget.profile.value!.images);
    }
  }

  imgFromGallery() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    var profile = ProfileModel.from(widget.profile.value!);

    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image != null) {
      profile.images.add(image.path);
      widget.profile.value = profile;
      s.setStringList("images", widget.profile.value!.images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProfileModel?>(
        valueListenable: widget.profile,
        builder: (context, ProfileModel? value, Widget? child) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Align(
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 15,
                  runSpacing: 10,
                  children: [
                    PictureSelector(
                      onPressed: widget.profile.value!.images.length > 1
                          ? () => showPicker(context, 0)
                          : () => {},
                      isActive: checkIfTileActive(0),
                      image: widget.profile.value!.images[0],
                    ),
                    PictureSelector(
                      onPressed: () => showPicker(context, 1),
                      isActive: checkIfTileActive(1),
                      image: widget.profile.value!.images.length >= 2
                          ? widget.profile.value!.images[1]
                          : null,
                    ),
                    PictureSelector(
                      onPressed: () => showPicker(context, 2),
                      isActive: checkIfTileActive(2),
                      image: widget.profile.value!.images.length >= 3
                          ? widget.profile.value!.images[2]
                          : null,
                    ),
                    PictureSelector(
                      onPressed: () => showPicker(context, 3),
                      isActive: checkIfTileActive(3),
                      image: widget.profile.value!.images.length >= 4
                          ? widget.profile.value!.images[3]
                          : null,
                    ),
                    PictureSelector(
                      onPressed: () => showPicker(context, 4),
                      isActive: checkIfTileActive(4),
                      image: widget.profile.value!.images.length >= 5
                          ? widget.profile.value!.images[4]
                          : null,
                    ),
                    PictureSelector(
                      onPressed: () => showPicker(context, 5),
                      isActive: checkIfTileActive(5),
                      image: widget.profile.value!.images.length >= 6
                          ? widget.profile.value!.images[5]
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
