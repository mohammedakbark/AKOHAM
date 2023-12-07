import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';

class NotificationTabOrganization extends StatefulWidget {
  NotificationTabOrganization({super.key});

  @override
  State<NotificationTabOrganization> createState() =>
      _NotificationTabOrganizationState();
}

class _NotificationTabOrganizationState extends State<NotificationTabOrganization> {
  int initialIndex = 0;
  String time = DateFormat('h:mm a').format(DateTime.now());
  String day = DateFormat('EEEE').format(DateTime.now());
  String date = DateFormat("dd/m/yyyy").format(DateTime.now());
  List<String> imageSrc = [
    "https://s3-alpha-sig.figma.com/img/e9d5/d743/540e9feb09e3586ba71347d6e8289682?Expires=1702252800&Signature=SwcG8GlEjo-rlgaZ2ir1ZVV3l8ZTc-Mmnx2NgHQLu8uGLMLHeYq5GZHTob-GIv9l-8EOakqIhvyi0SohCwD0aQKLI-14Ke1hfsiCkIuJGVl2AouNBVs~b5hB9s8~oXKasphFV9KUFR5A8yvCprJQvNMPUELa44twjXV1x~CuonplrtFeeZdeDYPOXvI9d38QBiIPKnYleEPaeC86-hSaT~iEqAefjI8AZb-REUlqnmBvrx7mhinfNQXJR66oX~HG8muQu3Uee4TrN~Gciy37zJVS-DgaDIbrw6O2RLbey~sdn4AtBEiVg-x3w-oodSJOEcQRXoeTOWPgmLq7jEisJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4", // scale: 30,
    "https://s3-alpha-sig.figma.com/img/c899/5d1c/5fe610ac7641430bf5258d5c43a78413?Expires=1702252800&Signature=OBtdekXOTC2kkif~pxccggze-68X7Yo~1PPHYpmJU-cJXSGlqCmc8ZYzp-fL8BbxoVxvANuJmCt3D3JNNZ3zO3X2VzyJ-Pr5sAP4wtOxIrCP3hh3WTv3u-ramxgVKnWrGoU7LXEuxxw7RQ0z15lTIZPHjTj7hHE~H5LaPS-P-1WTzAxzZ2DeGDpLCwp8D16-VbAvNWQ60qgyrLWc7UJcUt551AodkZyxwzeET7BTvzblPUkkOmKH~hyHeinuET2IMRYs~VkOnenQr~NTXsawWzvCMSpUGZ8RLYiXaLmxlsxPd58djOqb0G4c6Y-AKn6uNpCS9NqnG0QpzRfi7OGO8g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
    "https://s3-alpha-sig.figma.com/img/fa20/bc06/2deb16afff00b283a126f9a481cc148d?Expires=1702252800&Signature=b9iRbTh9yLYbkE68~FSYMaDa1Lh0zzqNV-a8IKciexYYuYXp9AE5XJR93u0JQD1x9ph6AeCYAB65t7vda58fNOWEaYXU5FOH9LxGT-GfbUZKhC-6hUowW2gUnOk5AqUJnFoVB5l3XaKvnZBqhaZ7aY3N2lxcVbXi5pYWzgqIfjP5lFHPgEbhCognYoZue3tiN5vDA3iEyv3MqndDFyFsmMmwEasEzFP~DnpLP1fFULJaY3G7ioA09B~g5vBzaJXVFQH~eN-GKvminC5FKqQtu4cWRoGu7uWdKfPNX4jANk0IZJdu4PW1PFqvkayprGEI0d4j1y8Uzw1OjjeHJh179g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
  ];

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          toolbarHeight: hight * .09,
          title: customeText(text: "Notification", size: 26),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0), // Adjust the height as needed
            child: SizedBox(
              width: double.infinity,
              child: TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 70),
                  isScrollable: true,
                  onTap: (index) {
                    // if (index == 0) {
                    //   // gender = "Female";
                    // } else {
                    //   // gender = "Male";
                    // }
                  },
                  labelColor: black,
                  indicator: const TabBarGradientIndicator(
                      indicatorWidth: 3,
                      gradientColor: [
                        Color.fromARGB(255, 0, 255, 8),
                        Colors.blue
                      ]),
                  tabs: [
                    Tab(
                      child: customeText(text: "Supporting", size: 20),
                    ),
                    Tab(
                      child: customeText(text: "All", size: 20),
                    )
                  ]),
            ),
          ),
        ),
        body: Container(
          height: hight,
          width: width,
          margin: const EdgeInsets.all(20),
          child: TabBarView(children: [
            ListView.separated(
                itemBuilder: (context, index) => notificationFromOrphanage(
                    orphanageName: "orphanage Name",
                    hight: hight,
                    width: width,
                    ontap: () {},
                    requestDate: date,
                    requestTime: time,
                    day: day,
                    requestText:
                        "This orphanage is in an immediate need for clothes. please consider a help.",
                    userImage: Image.network(
                      imageSrc[index],
                      fit: BoxFit.fill,
                    )),
                separatorBuilder: (context, index) => Gap(20),
                itemCount: imageSrc.length),
            ListView.separated(
                itemBuilder: (context, index) => notificationFromOrphanage(
                    orphanageName: "Orpahange name",
                    width: width,
                    hight: hight,
                    ontap: () {},
                    requestDate: date,
                    requestTime: time,
                    day: day,
                    requestText:
                        "This orphanage is in an immediate need for clothes. please consider a help.",
                    userImage: Image.network(
                      imageSrc[index],
                      fit: BoxFit.fill,
                    )),
                separatorBuilder: (context, index) => const Gap(20),
                itemCount: imageSrc.length),
          ]),
        ),
      ),
    );
  }

  Widget notificationFromOrphanage(
      {userImage,
      required hight,
      required width,
      String? requestText,
      requestDate,
      required orphanageName,
      day,
      requestTime,
      Function()? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 106,
        decoration: BoxDecoration(
            color: appThemeGrey, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Gap(),
                customeText(text: orphanageName, textcolor: grey600, size: 10),
                Gap(130),
                customeText(
                    textcolor: grey600,
                    text: "${requestDate.toString()} ${day.toString()}",
                    size: 10),
                // const Gap(6),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    child: userImage,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const Gap(20),
                SizedBox(
                  height: 50,
                  width: width / 3,
                  child: customeText(
                      text: requestText,
                      overflow: TextOverflow.ellipsis,
                      size: 14,
                      maxLines: 2),
                ),
                const Gap(20),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {},
                    child: customeText(
                      text: "Intrested",
                      size: 12,
                      textcolor: white,
                    )),
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
