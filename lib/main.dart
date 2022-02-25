import 'dart:io';

import 'package:dash_invitation/controllers/InvitationDataController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {
        return Home();
      }),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff48D2FD),
              Color(0xffADF6FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          children: [InvitationCard(), InvitationButtons()],
        ),
      )),
    );
  }
}

class InvitationCard extends StatelessWidget {
  //share and screenshot
  GlobalKey previewContainer = GlobalKey();
  int originalSize = 800;

  static const int screenDivideFactor = 3;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ShareFilesAndScreenshotWidgets().shareScreenshot(previewContainer,
            originalSize, "This invitation from dash", "Name.jpg", "image/jpg",
            text: "This is the caption!");
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RepaintBoundary(
            key: previewContainer,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              width: getWidth(context) / screenDivideFactor,
              child: InvitationContent(),
            ),
          ),
        ],
      ),
    );
  }

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

class InvitationContent extends StatefulWidget {
  InvitationContent({Key? key}) : super(key: key);

  @override
  State<InvitationContent> createState() => _InvitationContentState();
}

class _InvitationContentState extends State<InvitationContent> {
  static const double sizedBoxHeight = 32.0;
  late TextDirection textDirection;
  final controller = Get.put(InvitationDataController());

  @override
  Widget build(BuildContext context) {
    textDirection = Directionality.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Obx(
                () => Image.asset(
                  '${controller.imageUrl}',
                  height: 100,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "دعوة حضور",
                  style: setTextStyle(fontSize: 40),
                ),
              ),
              const SizedBox(
                height: sizedBoxHeight,
              ),
              Obx(() => Text(
                    '${controller.name}',
                  )),
              Obx(
                () => Text(
                  "سأسعد برؤيتك يوم ${controller.day}  ${controller.month} ، في مدينة  ${controller.city}.",
                  style: setTextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: sizedBoxHeight,
              ),
              Text(
                "مع تحياتي،\nداش",
                style: setTextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle setTextStyle({
    required double fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: "FFYaseer",
    );
  }
}

class InvitationCardForm extends StatefulWidget {
  InvitationCardForm({Key? key}) : super(key: key);

  @override
  State<InvitationCardForm> createState() => _InvitationCardFormState();
}

class _InvitationCardFormState extends State<InvitationCardForm> {
  var imageList = [
    Image.asset(
      'images/dash_1.png',
      semanticLabel: "images/dash_1.png",
      height: 100,
    ),
    Image.asset(
      'images/dash_2.png',
      semanticLabel: "images/dash_2.png",
      height: 100,
    ),
    Image.asset(
      'images/dash_3.png',
      semanticLabel: "images/dash_3.png",
      height: 100,
    ),
    Image.asset(
      'images/dash_4.png',
      semanticLabel: "images/dash_4.png",
      height: 100,
    ),
    Image.asset(
      'images/dash_5.png',
      semanticLabel: "images/dash_5.png",
      height: 100,
    ),
    Image.asset(
      'images/dash_6.png',
      semanticLabel: "images/dash_6.png",
      height: 100,
    )
  ];

  @override
  Widget build(BuildContext context) {
    InvitationDataController controller = Get.put(InvitationDataController());
    return Container(
      height: 500.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                controller.setName(value);
              },
              decoration: setInputDecoration(hint: "الٍاسم"),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    onChanged: (value) {
                      controller.setMonth(value);
                    },
                    decoration: setInputDecoration(hint: "الشهر"),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    onChanged: (value) {
                      controller.setDay(value);
                    },
                    decoration: setInputDecoration(hint: "اليوم"),
                    textInputAction: TextInputAction.next,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              onChanged: (value) {
                controller.setCity(value);
              },
              decoration: setInputDecoration(hint: "المدينة"),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: index < imageList.length
                            ? imageList[index]
                            : Text("out!"),
                        onTap: () {
                          var selectedImageUrl =
                              imageList[index].semanticLabel.toString();
                          controller.setImageUrl(selectedImageUrl);
                        },
                      );
                    },
                    itemCount: imageList.length)),
            Text("يمكنك الأختيار ملابس داش المفضل لديك من القائمة الأفقية"),
          ],
        ),
      ),
    );
  }

  InputDecoration setInputDecoration({required String hint}) {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        hintText: hint,
        hintTextDirection: TextDirection.rtl,
        filled: true,
        fillColor: Colors.white);
  }
}

class InvitationButtons extends StatelessWidget {
  const InvitationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: InvitationCardForm());
                    },
                  );
                },
                child: Text("Hi")),
          )
        ],
      ),
    );
  }
}
