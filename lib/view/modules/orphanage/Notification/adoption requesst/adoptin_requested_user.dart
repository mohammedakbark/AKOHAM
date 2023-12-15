import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/delete_single_child_detail_page.dart';

class AdoptionRequestedUserProfileOrphanage extends StatelessWidget {
  AdoptionRequestedUserProfileOrphanage({super.key});
  bool isUserNotIndividual = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Notification"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: orientation == landScapeMode ? width : hight,
          width: width,
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customeText(text: "User Profile", size: 22),
              Gap(20),
              Card(
                elevation: 0,
                color: appThemeGrey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white),
                        child: Center(
                          child: customeText(
                              text: isUserNotIndividual
                                  ? "Individual"
                                  : "Organization",
                              textcolor: isUserNotIndividual
                                  ? Colors.green
                                  : Colors.blue),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(39),
                                image: DecorationImage(image: imageNotFound)),
                          ),
                          SizedBox(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customeText(text: "Name", size: 16),
                                  customeText(text: "Contact no.", size: 16),
                                  customeText(text: "Email", size: 16),
                                  customeText(text: "Location", size: 16),
                                ],
                              ),
                              const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  seperatorText,
                                  seperatorText,
                                  seperatorText,
                                  seperatorText,
                                ],
                              ),
                              Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customeText(text: "User123", size: 16),
                                    customeText(text: "1234567890", size: 16),
                                    customeText(text: "user@g.com", size: 16),
                                    customeText(text: "smaple loc", size: 16),
                                  ])
                            ],
                          ),
                        ),
                      ),
                      Gap(30),
                      easyButton(
                        context: context,
                        text: "Contact now",
                        fontWeight: FontWeight.w300,
                        textcolor: grey600,
                        bgColor: MaterialStatePropertyAll(white),
                      ),
                      Gap(30),
                    ],
                  ),
                ),
              ),
              Gap(20),
              customeText(text: "Requested Child", size: 22),
              Gap(5),
              Container(
                height: hight * .2,
                width: width,
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: appThemeGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            // Get.to(EditOrDeleteSingleChildDataPageOrphanage());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: white),
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                    image:
                                        DecorationImage(image: imageNotFound),
                                    borderRadius: BorderRadius.circular(10),
                                    color: white),
                                height: 60,
                                width: 60,
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customeText(
                                          text: "Name", textcolor: grey600),
                                      customeText(
                                          text: "Age", textcolor: grey600),
                                      customeText(
                                          text: "Gender", textcolor: grey600)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customeText(
                                          text: ":", textcolor: grey600),
                                      customeText(
                                          text: ":", textcolor: grey600),
                                      customeText(text: ":", textcolor: grey600)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customeText(
                                          text: "Sample name",
                                          textcolor: grey600),
                                      customeText(
                                          text: "6", textcolor: grey600),
                                      customeText(
                                          text: "femail", textcolor: grey600)
                                    ],
                                  )
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                    color: grey600,
                                  )),
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => const Gap(20),
                    itemCount: 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
