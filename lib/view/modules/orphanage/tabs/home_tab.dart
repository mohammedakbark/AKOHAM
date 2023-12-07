import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Notification/Notification_category_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/sendrequestPages/send_request_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/userprofile/editprofile/edit_profile_image_page.dart';

class HomeTabOrphanage extends StatelessWidget {
  HomeTabOrphanage({super.key});
  List<Image> ImageList = [
    Image.network(
      "https://s3-alpha-sig.figma.com/img/3a45/ad62/c914cf4758bd2fe01f7918228bcef146?Expires=1702252800&Signature=RqUWlz~2T14DxIVhH13GNuE3RB-Xtwqnlxiz3H7349j2MtiSZNUoIUtQzpdpndSofi~SZOu5fixPBu1P7LiFPswALlqzyvj4dD27WQxzAxqqkb42BmT7kiZF-7G3RZSgtGXmR6VUTkJUqcwtqqkYy7JoA1z44ulbkzKEdHifH5-KH-SAUokD3R4UnHJYpDZY4GqDQGjcua965s3ZRhU-7yxlU9Wzqjd6cuF4W19mLZ0EE54UNcMcmtJENhRslgn5twu8bEmtoqpH3Vys5g5wCUSTbrOenDsUyOXT7GZMlnD-wdXjvKm1kHBF8F2Pj154X3DwJxO08j9wlMTQ6s4HCw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      fit: BoxFit.fill,
    ),
    Image.network(
      "https://s3-alpha-sig.figma.com/img/77c7/9e2e/f9359dcf618367323b99cc26685bdd60?Expires=1702252800&Signature=UYRAtl7bRKuvJiZSjQ7DmFsopFZXUKkGvF~3ReYRxZclBETBTNkPn1rewCcwUz4O2DzhZXtw3oOUU2lDhjpHv6K2tELTWKt9qDNhFgsuUU-oRTNypGVbrwdgYk47~POLeyl8C0GnN66V8eqj2xVmNm6ztF0YV79rGBBHjvWrMuWGArSk9N-MALRKRxQKUOHSdSlmYbC2V1YhgiUh2Ifixhc7X7e4uK4jdvq1GiWM3vKystgGJlKobqhBLDvLK3I49wlc8UPM7hTD~tG~sxMOrcOiNTA2plaOcTyxuQJiTnGztuo5tQAK3VkZBbri587bH5L0dCUu61GcJz0jvMVQuQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      fit: BoxFit.fill,
    ),
    Image.network(
      "https://s3-alpha-sig.figma.com/img/7630/b403/b8f0dc2a9b2883fdc9e4903bb522c017?Expires=1702252800&Signature=f57yRNZFO~NWoStGamGKNoGu-gBLfOLbBCNXIVv1915D06eu~I59g2Xbtfzeh5PqBJ8uYH4GJZ7HBeR~0yJRPPyb-jNP2YMEOs83fm69a14Q9UhU7~lqwWK0DUqyb2OkBOR0Lse0lerjox6Iv50DlmHm1MhhbsXuucw1cx1WX74YZsicy38AE19ka7pYt7lOswLKwPhCbPVfqOwQA5q8bz0cwonTeZ2sBZdikJZ42HQAQwEeeKJGjHPCOgR~LbQ~J2iABNmL7FAWZye3zJCVXWZs-BFXCXMQow0Gysx~4iEHs4963KI8zhaKVIbEp1tk9uOzxy8RTlwrHbHNPXC6BQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      fit: BoxFit.fill,
    ),
    Image.network(
        "https://s3-alpha-sig.figma.com/img/5e5c/3579/7de0605d4ed8367b12e75578d9b497b0?Expires=1702252800&Signature=LBSgdxHHeItMZBxSlKSJ5~McyM971UdKPb~l~QUCtg2AXmO1t2QRiTSqFtlD1GeqhzNzfhAjSEs6hC74fRn2kzWZBuIMbJnm-219v5zGDVaOxSbEsDsHVFpygdIhQ02gR7uQ-BAayR9NmZs2Lhx3Rr2b9FteOpmu2UgMRZLXhCyDommcXBTfMwmDJ~bYC84bZi19oggCK-OnOCd8oLJKtwwR~PdsLO107FEbZ1mJWEDNuMTKGS-ShtAEHcRHn-01SZTAA0e5JdVMCe2dAiIWu4vCQZxKGBHsPHVjE1bTjsY6q5-Mcs4CqxERgxSv-PUIpyHRF9iXXdSt7lNHhszz~Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
        fit: BoxFit.fill),
  ];
  List<Widget> textList = [
    customeText(text: "Funds", textcolor: white, size: 20),
    customeText(text: "Food", textcolor: white, size: 20),
    customeText(text: "Education", textcolor: white, size: 20),
    customeText(text: "Cloths", textcolor: white, size: 20)
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const NotificationCategoryPageOrphanage());
              },
              icon: const Icon(
                Icons.notifications_none,
                size: 34,
              ))
        ],
        centerTitle: true,
        title: customeText(text: "Home"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: width,
          height: orientation == landScapeMode ? width : hight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customeText(text: "Your Orphanage", size: 24),
              const Gap(8),
              Container(
                  height:
                      orientation == landScapeMode ? hight * .5 : hight * .29,
                  width: width * .9,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: appThemeGrey,
                  ),
                  child: Column(children: [
                    customeText(text: "Orphanage Name"),
                    SizedBox(
                      width: width * .9,
                      height: orientation == landScapeMode
                          ? hight * .35
                          : hight * .22,
                      child: Image.network(
                        "https://s3-alpha-sig.figma.com/img/3d8d/1bfc/59ea5d5029e84319bd6ad7c1d9bbbd9c?Expires=1702252800&Signature=OomWDlytLpsRfSj1WfJqZMDLGAT6QRwvrC8afKL4VF95yZkQGXWvZfBcZbcSwUL3Cu-7JsloyiqnfxG-tW4XuTRcygVrdAET-AKD~oQZzrZjDLh~CrTrND7bnfYgRBFxa2PPh65Z2RzBdfX9KFJNLF0CSNA0Hco7JseGbX2EcxqgMPE~t00yJh3EYSy-GvwZ-HiUgWs6M6bIICTc1~ERHQN-S7ROrfwzrkX-zzl6t~MHjorvXZSYahxLYhLvg96viebdQnj24fMGvtvu4ueHOq80qh6cwgkQpCplnBedifhXZF2p~OoK9kF6MyA9zfPv3v-0sjzem8ErnQgFw5tjYQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: width * .3,
                      height: orientation == landScapeMode
                          ? hight * .08
                          : hight * .04,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(const EditProfileImageOrphanage());
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(white),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        child: customeText(
                            text: "View Profile", textcolor: black, size: 15),
                      ),
                    ),
                  ])),
              const Gap(8),
              customeText(text: "Request donation", size: 20),
              const Gap(8),
              SizedBox(
                height: orientation == landScapeMode ? hight * .6 : hight * .25,
                width: width,
                child: GridView.builder(
                  itemCount: ImageList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 100,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.to(SendRequestToUserOrphanage(passedIndex: index));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 60, child: ImageList[index]),
                          textList[index]
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
