import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Notification/adoption%20requesst/adoptin_requested_user.dart';

class AdoptionRequestNotifiOrphanage extends StatelessWidget {
  AdoptionRequestNotifiOrphanage({super.key});
  String time = DateFormat('h:mm a').format(DateTime.now());
  String day = DateFormat('EEEE').format(DateTime.now());
  String date = DateFormat("dd/m/yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: customeText(text: "Notification"),
        ),
        body: Container(
            margin: const EdgeInsets.all(20),
            height: double.infinity,
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Gap(20),
              customeText(text: "Adoption request", size: 22),
              const Gap(20),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => adoptionRequest(
                        ontap: () {
                          Get.to(AdoptionRequestedUserProfileOrphanage());
                        },
                        userImage: imageNotFound,
                        requestText:
                            "Useruserr requested for adoption - of a child"
                            "Useruserr requested for adoption - of a child"
                            "Useruserr requested for adoption - of a child",
                        day: day,
                        requestDate: date,
                        requestTime: time),
                    separatorBuilder: (context, index) => Gap(30),
                    itemCount: 5),
              )
            ])));
  }

  Widget adoptionRequest(
      {userImage,
      String? requestText,
      requestDate,
      day,
      requestTime,
      Function()? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 102,
        decoration: BoxDecoration(
            color: appThemeGrey, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            customeText(
                textcolor: grey600,
                text: "${requestDate.toString()} ${day.toString()}",
                size: 10),
            Gap(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(39),
                      image: DecorationImage(image: userImage)),
                ),
                Gap(20),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: customeText(
                      text: requestText,
                      overflow: TextOverflow.ellipsis,
                      size: 14,
                      maxLines: 2),
                ),
                Gap(20),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18,
                  color: black,
                ),
              ],
            ),
            customeText(
                text: requestTime.toString(), textcolor: grey600, size: 10)
          ],
        ),
      ),
    );
  }
}
