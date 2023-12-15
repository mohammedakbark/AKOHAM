import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';

class DonatedUserProfileOrphanage extends StatefulWidget {
  String userType;
  DonatedUserProfileOrphanage({super.key, required this.userType});

  @override
  State<DonatedUserProfileOrphanage> createState() =>
      _DonatedUserProfileOrphanageState();
}

class _DonatedUserProfileOrphanageState
    extends State<DonatedUserProfileOrphanage> {
  bool isUserNotIndividual = true;
  bool isExpanded = false;

  Color getColorForText({String? userType}) {
    // Use the enum directly to determine the color based on the text
    switch (userType) {
      case "Organization":
        return Colors.blue;
      case "Individual":
        return Colors.green;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Notification"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customeText(text: "User Profile", size: 22),
              const Gap(20),
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
                          text: widget.userType,
                          textcolor: getColorForText(userType: widget.userType),
                        )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(image: imageNotFound)),
                          ),
                          const SizedBox(),
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
                      const Gap(30),
                      easyButton(
                        context: context,
                        text: "Contact now",
                        fontWeight: FontWeight.w300,
                        textcolor: grey600,
                        bgColor: MaterialStatePropertyAll(white),
                      ),
                      const Gap(30),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              widget.userType == "Organization"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customeText(text: "About Us", size: 22),
                        const Gap(20),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          width: width,
                          height: isExpanded ? hight * .2 : hight * .1,
                          decoration: BoxDecoration(
                              color: appThemeGrey,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Details of orphanage like establishment date \n"
                                " history contributions etc and more details for users.Details of "
                                "orphanage like establishment date , history contributions etc and"
                                " more details for users.Details of orphanage like establishment date "
                                ", history contributions etc and more details for users",
                                style: GoogleFonts.jua(fontSize: 13),
                                overflow: isExpanded
                                    ? TextOverflow.clip
                                    : TextOverflow.ellipsis,
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                  child: customeText(
                                      text: isExpanded
                                          ? "read less"
                                          : "read more",
                                      textcolor: grey600))
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
