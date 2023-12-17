import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:orphanagemanagement/model/other_models/donation_accepted_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';
import 'package:orphanagemanagement/viewmodel/services_provider.dart';
import 'package:provider/provider.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';

class NotificationTabIndividual extends StatefulWidget {
  NotificationTabIndividual({super.key});

  @override
  State<NotificationTabIndividual> createState() =>
      _NotificationTabIndividualState();
}

class _NotificationTabIndividualState extends State<NotificationTabIndividual> {
  int initialIndex = 0;
  String time = DateFormat('h:mm a').format(DateTime.now());
  String day = DateFormat('EEEE').format(DateTime.now());
  String date = DateFormat("dd/m/yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    Provider.of<ServiceProvider>(context, listen: false)
        .fetchOnlySupportingOrphanageRequestIndividual(context, currentUserId);
    // final data = storeInstence.fetchAllOrphanages();
    print("${serviceProviderinstence.helpReqList.length}jvhhhhhhhhhh");
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
        body: Consumer<ServiceProvider>(builder: (context, service, child) {
          return Container(
            height: hight,
            width: width,
            margin: const EdgeInsets.all(20),
            child: TabBarView(children: [
              ListView.separated(
                  itemBuilder: (context, index) {
                    // serviceProviderinstence.fectSupportingData(
                    //     service.helpReqList[index].orphanId, index, );

                    return notificationFromOrphanage(
                        orphanageName: service.supportingHelpReqList[index][index].name,
                        hight: hight,
                        width: width,
                        ontap: () {
                          service.addDonationAcceptecetoFireStore(
                              DonationAcceptedmodel(
                                  orphanageId:
                                      service.helpReqList[index].orphanId,
                                  data:
                                      "${storeInstence.indivRegModel!.name} is intrested to Donate ${service.helpReqList[index].reqType}",
                                  dateAndDay: "$date $day",
                                  donationCategory:
                                      service.helpReqList[index].reqType,
                                  image:
                                      "${storeInstence.indivRegModel?.image}",
                                  time: time,
                                  userType: "Individual",
                                  userid:
                                      storeInstence.indivRegModel?.senderId),
                              context,
                              service.helpReqList[index].orphanId);
                          noti("Intrest Send Successfull");
                        },
                        requestdateAndday: service
                            .supportingHelpReqList[index][index].dataAndDay,
                        time: service.supportingHelpReqList[index][index].time,
                        requestText:
                            service.supportingHelpReqList[index][index].data,
                        userImage: NetworkImage(service
                                .supportingHelpReqList[index][index].image) ??
                            imageNotFound);
                  },
                  separatorBuilder: (context, index) => const Gap(20),
                  itemCount: service.supportingHelpReqList.length),
              ListView.separated(
                  itemBuilder: (context, index) => notificationFromOrphanage(
                      orphanageName: service.helpReqList[index].name,
                      width: width,
                      hight: hight,
                      ontap: () {
                        service.addDonationAcceptecetoFireStore(
                            DonationAcceptedmodel(
                                orphanageId:
                                    service.helpReqList[index].orphanId,
                                data:
                                    "${storeInstence.indivRegModel!.name} is intrested to Donate ${service.helpReqList[index].reqType}",
                                dateAndDay: "$date $day",
                                donationCategory:
                                    service.helpReqList[index].reqType,
                                image: service.helpReqList[index].image,
                                time: time,
                                userType: "Individual",
                                userid: storeInstence.indivRegModel?.senderId),
                            context,
                            service.helpReqList[index].orphanId);
                        noti("Intrest Send Successfull");
                      },
                      //
                      //
                      requestdateAndday: service.helpReqList[index].dataAndDay,
                      time: service.helpReqList[index].time,
                      requestText: service.helpReqList[index].data,
                      userImage:
                          NetworkImage(service.helpReqList[index].image) ??
                              imageNotFound),
                  separatorBuilder: (context, index) => const Gap(20),
                  itemCount: service.helpReqList.length),
            ]),
          );
        }),
      ),
    );
  }

  Widget notificationFromOrphanage(
      {userImage,
      required hight,
      required width,
      String? requestText,
      required orphanageName,
      time,
      requestdateAndday,
      Function()? ontap}) {
    return Container(
      height: 106,
      decoration: BoxDecoration(
          color: appThemeGrey, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: customeText(
                    text: orphanageName, textcolor: grey600, size: 10),
              ),

              customeText(
                  textcolor: grey600, text: "${requestdateAndday}", size: 10),
              // const Gap(6),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.fill, image: userImage),
                    shape: BoxShape.circle),
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
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: ontap,
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
          customeText(text: time.toString(), textcolor: grey600, size: 10)
        ],
      ),
    );
  }
}
