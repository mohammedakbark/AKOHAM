import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/delete_single_child_detail_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/userprofile/editprofile/edit_profile_page.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';

class SettingsTabOrphanage extends StatelessWidget {
  SettingsTabOrphanage({super.key});
  FirebaseAuths firebaseAuths = FirebaseAuths();
  Image penImage = Image.network(
    'https://s3-alpha-sig.figma.com/img/15ad/3116/0314fdc8dec88d736d02964f2019687e?Expires=1702252800&Signature=DXilRh0IbOkml2DAVFM6oFbVCjJcKg96FqLVP3PuylVnjPsKpUoREMWr-8AoNdbnAjUAF4wEM4HA210kaC5wAQPrQ84M~oUnVW09lTzDNmKXEbvDU5GBCzKfqeX6r~ZARwmz7niMYhgnMIZi4B6VhWj99eLFF~qNDzU4aSqZ~5ZjhCWG~1CI6Oyq6-EcUzHvcse4nw93B6blMKMAK9S3JTo9zzRhInZl7YbbhD8fLRa12BUHqgJj~HzjDx6boX8Yd5yQS6AzUVMX-K5oIGrTiTbFrjhD1bP2IHHWATdSAe4gIsoGxkwRJVTDQbCMLqU73tEUn-vJz1ZzK6tYttrpQg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    scale: 3,
  );
  Image logoutImage = Image.network(
    "https://s3-alpha-sig.figma.com/img/ecf6/f1fc/79b9550be9b26ffb46c501540141a5b7?Expires=1702252800&Signature=f6I8LtBE7padRIxUcmv2R2CFxm5kG~xxyA4iLHuDP6U5sVC9nx3fFpcOgXl-~XNstaQivIAl62RzNmXucZQOSCnrOQBWMM8Yq0C7mytF0QIsYYTCqe0Mr9p9ylTXDmmaLJr1J38LiK2uNTYw8miXObWlPQ-1D8qtdh1cxkK3~G~KUWKbj5glX37zGzXMq0tEggRmi04j6Lq1SAnCy6zIZNNhWsXepMQFrdjQ9Ti5jwOFIhAWpXNbY14n7aWi8O4q8~pYVo68o0xM95wBd8Qd0~S~BSYItvwdnLNNQWGy~rDPxlslxp0zgf8wX1yHzacxBJtybTL81cmUOxreOS8N4w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
    scale: 3,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Settings"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customeText(
              text: "Settings",
              size: 25,
            ),
            const Gap(20),
            easyButton(
                onpressed: () {
                  Get.to(EditProfileOrphanage());
                },
                bgColor: MaterialStatePropertyAll(appThemeGrey),
                image: penImage,
                text: "Edit Profile",
                textcolor: grey600,
                context: context,
                fontWeight: FontWeight.w400),
            const Gap(30),
            easyButton(
                onpressed: () {
                  Get.to(EditOrDeleteSingleChildDataPageOrphanage());
                },
                bgColor: MaterialStatePropertyAll(appThemeGrey),
                image: penImage,
                text: "Edit Child Data",
                textcolor: grey600,
                context: context,
                fontWeight: FontWeight.w400),
            const Expanded(child: SizedBox()),
            easyButton(
                onpressed: () {
                  firebaseAuths.signOut(context);
                },
                bgColor: MaterialStatePropertyAll(appThemeGrey),
                image: logoutImage,
                text: "Log out",
                textcolor: grey600,
                context: context,
                fontWeight: FontWeight.w400)
          ],
        ),
      ),
    );
  }

  Widget easyButton(
      {String? text,
      FontWeight? fontWeight,
      context,
      image,
      bordersideWidth,
      void Function()? onpressed,
      MaterialStateProperty<Color?>? bgColor,
      textcolor}) {
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * .90,
      height: orientation == landScapeMode ? hight * .08 : hight * .06,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
          side: MaterialStateProperty.all(
              BorderSide(color: black, width: bordersideWidth ?? 0)),
          backgroundColor: bgColor,
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(30),
            image ?? const SizedBox(),
            Gap(20),
            customeText(
                text: text,
                textcolor: textcolor,
                size: 20,
                fontWeight: fontWeight ?? FontWeight.w600),
            Gap(30),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
