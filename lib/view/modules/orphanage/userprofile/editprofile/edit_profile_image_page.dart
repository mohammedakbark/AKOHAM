
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';

class EditProfileImageOrphanage extends StatelessWidget {
  const EditProfileImageOrphanage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Profile Image"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Column(children: [
          customeText(text: "Edit profile image", size: 18, textcolor: grey600),
          Gap(20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
                "https://s3-alpha-sig.figma.com/img/3d8d/1bfc/59ea5d5029e84319bd6ad7c1d9bbbd9c?Expires=1702252800&Signature=OomWDlytLpsRfSj1WfJqZMDLGAT6QRwvrC8afKL4VF95yZkQGXWvZfBcZbcSwUL3Cu-7JsloyiqnfxG-tW4XuTRcygVrdAET-AKD~oQZzrZjDLh~CrTrND7bnfYgRBFxa2PPh65Z2RzBdfX9KFJNLF0CSNA0Hco7JseGbX2EcxqgMPE~t00yJh3EYSy-GvwZ-HiUgWs6M6bIICTc1~ERHQN-S7ROrfwzrkX-zzl6t~MHjorvXZSYahxLYhLvg96viebdQnj24fMGvtvu4ueHOq80qh6cwgkQpCplnBedifhXZF2p~OoK9kF6MyA9zfPv3v-0sjzem8ErnQgFw5tjYQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
          ),
          Gap(20),
          easyButton(
            bordersideWidth: 1.5,
            context: context,
            text: "Add new Image",
            fontWeight: FontWeight.w400,
            textcolor: black,
            bgColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          Gap(20),
          easyButton(
            bordersideWidth: 1.5,
            context: context,
            text: "Remove Image",
            fontWeight: FontWeight.w400,
            textcolor: black,
            bgColor: MaterialStatePropertyAll(Colors.transparent),
          ),
        ]),
      ),
    );
  }
}
