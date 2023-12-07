import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/userprofile/editprofile/edit_profile_page.dart';

class ProfileTabOrphanage extends StatefulWidget {
  const ProfileTabOrphanage({super.key});

  @override
  State<ProfileTabOrphanage> createState() => _ProfileTabOrphanageState();
}

class _ProfileTabOrphanageState extends State<ProfileTabOrphanage> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Profile"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              customeText(text: "Orphanage name", size: 22),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: width * .9,
                  height:
                      orientation == landScapeMode ? hight * .4 : hight * .25,
                  child: Image.network(
                    "https://s3-alpha-sig.figma.com/img/3d8d/1bfc/59ea5d5029e84319bd6ad7c1d9bbbd9c?Expires=1702252800&Signature=OomWDlytLpsRfSj1WfJqZMDLGAT6QRwvrC8afKL4VF95yZkQGXWvZfBcZbcSwUL3Cu-7JsloyiqnfxG-tW4XuTRcygVrdAET-AKD~oQZzrZjDLh~CrTrND7bnfYgRBFxa2PPh65Z2RzBdfX9KFJNLF0CSNA0Hco7JseGbX2EcxqgMPE~t00yJh3EYSy-GvwZ-HiUgWs6M6bIICTc1~ERHQN-S7ROrfwzrkX-zzl6t~MHjorvXZSYahxLYhLvg96viebdQnj24fMGvtvu4ueHOq80qh6cwgkQpCplnBedifhXZF2p~OoK9kF6MyA9zfPv3v-0sjzem8ErnQgFw5tjYQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Gap(30),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: width * .3,
                  height:
                      orientation == landScapeMode ? hight * .07 : hight * .04,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(EditProfileOrphanage());
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    child: customeText(
                        text: "Edit details", textcolor: black, size: 15),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: customeText(text: "About Us", size: 25)),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                width: width,
                height: orientation == landScapeMode
                    ? hight * .25
                    : isExpanded
                        ? hight * .25
                        : hight * .1,
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
                            text: isExpanded ? "read less" : "read more",
                            textcolor: grey600))
                  ],
                ),
              ),
              Gap(20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: orientation == landScapeMode ? hight * .6 : hight * .27,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customeText(text: "More details", size: 17),
                    const Divider(),
                    SizedBox(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customeText(text: "Number of Children", size: 16),
                              customeText(text: "Contact no.", size: 16),
                              customeText(text: "Email", size: 16),
                              customeText(text: "Location", size: 16),
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              seperatorText,
                              seperatorText,
                              seperatorText,
                              seperatorText,
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlankTextField(
                                context: context,
                              ),
                              BlankTextField(context: context),
                              BlankTextField(context: context),
                              BlankTextField(context: context)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: appThemeGrey,
                    borderRadius: BorderRadius.circular(13)),
                height: orientation == landScapeMode ? hight * .6 : hight * .27,
                child: Column(
                  children: [
                    customeText(text: "Bank details", size: 17),
                    const Divider(
                      color: Black54,
                    ),
                    SizedBox(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customeText(text: "Bank", size: 16),
                              customeText(text: "Account no.", size: 16),
                              customeText(text: "E-payment no.", size: 16),
                              customeText(text: "Contact no.", size: 16),
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              seperatorText,
                              seperatorText,
                              seperatorText,
                              seperatorText,
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BlankTextField(
                                context: context,
                              ),
                              BlankTextField(context: context),
                              BlankTextField(context: context),
                              BlankTextField(context: context)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
