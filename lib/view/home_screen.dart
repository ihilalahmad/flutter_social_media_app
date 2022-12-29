import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var list = [
    "https://images.pexels.com/photos/14332931/pexels-photo-14332931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1661535/pexels-photo-1661535.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://raw.githubusercontent.com/wiki/ko2ic/flutter_google_ad_manager/images/sample.gif",
    "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter_no.png",
    "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png",
  ];

  Future<void> downloadImage() async {
    for (var url in list) {
      try {
        var imageId = await ImageDownloader.downloadImage(
          url,
          destination: AndroidDestinationType.directoryPictures,
        );
        print(ImageDownloader.findPath(imageId!));
      } on PlatformException catch (error) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () => downloadImage(),
                child: Text('Download image'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
