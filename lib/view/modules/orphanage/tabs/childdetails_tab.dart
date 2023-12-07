
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/add_child_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/single_child_data_page.dart';

class ChildDetailsTabOrphanage extends StatefulWidget {
  const ChildDetailsTabOrphanage({super.key});

  @override
  State<ChildDetailsTabOrphanage> createState() =>
      _ChildDetailsTabOrphanageState();
}

class _ChildDetailsTabOrphanageState extends State<ChildDetailsTabOrphanage> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Image.network(
            "https://s3-alpha-sig.figma.com/img/6616/1729/a1caeb77f204845ce728aa70083d6589?Expires=1702252800&Signature=KYFCO1Y~SLlDYWbBt6kfXUxBlIr1bGz3QspqxG3OUTuipOnv31FUaFaYisOjkWPIR4Abwkp0xRz2uHYUjWoMj5AdCAnNGBCMs9BzmUPjvcG-oFQqajQoE6EMXOUtn0aBirE~zb8JS1YDBvQl1KqBSIgoTxUhfZLSIAQ6hcUri6fkPEvz52iHiO0VqS-faDGYOO0uSikPh~s326hLy0iTyLrTJDvWqwdpP2pw-W0A3Bc2vHJGIxhVwm9PfLgDJYjX8DPz6DWLiKYjSQ3YF80HuNEsSa9jBHHhAg4T5o5aARk-C38lZ2gU-tdRITAodoqJaZhBE6kNgSpNgwPKZ1l1Yg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
        centerTitle: true,
        title: customeText(
          text: "Child details",
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            customeText(text: "Toatal no : 4", size: 20, textcolor: grey600),
            const Gap(20),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Get.to(SingleChildDataOrphanage());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: appThemeGrey),
                            child: ListTile(
                              leading: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: white),
                                  height: 60,
                                  width: 60,
                                  child: Image.network(
                                    "https://s3-alpha-sig.figma.com/img/24ab/5518/d7c0717b33be2972fd5961a68ce64f6e?Expires=1702252800&Signature=QjStQLGE6H1-jL06bmiCvIkvFBY-8juw~0A6DXUHDa9nuVRduEl8r23QR66krGJZllPEQQ4eKErKkkwL1-WWXZfiI~WxpPj-9eoNPZ-OV~CV1xLgJP1p8Ot6DfgtqVyiQoTYudkaQcPi0z1ctcCsbL~evX7i1MANITbXZhdhYXVSYtSNCMxH7BUS-vWlVzAuabbLF9khL7qeDvHAr9bMTFi3d0vceL2nVsmI2m5MNGQ1lvk59an4~1vBwjzjAjeekrjiGwLvllsCGZbMDQeIf9wE7aE4QaR1BcmD4IEzDyxMZiKL0BFeBhL8YcK-L2n1zChGZ7NJBxu6olSZPR9jow__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                                    scale: 3,
                                  )),
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
                    itemCount: 4))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.all(20),
        height: 80,
        width: 80,
        child: FloatingActionButton(
          onPressed: () {
            Get.to(AddChildOrphanage());
          },
          elevation: 0,
          backgroundColor: appThemeGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                "https://s3-alpha-sig.figma.com/img/9710/824f/498625aaf004d5be78257887e9deabb6?Expires=1702252800&Signature=XgLeE5RrcPFsssksgAZJ4yd61KsKNMxxlHFWnpbD~N21QkfcIWJH75KIihf7d6IeB7CeiBIjbR9nQoPxI0yTUl9jOXeZBbUD0bslfOHFw7M-xjYroGZ8TZzbz4xhQMpSy9CoExaJRB-yNb1-WYqQc40qmUiLBxWlbn8L1hNIgzs~UDHPZhEN6ytgcVegIGPXlEwEKgyI9owwXS0hHTEgq9cuDmnrqnED1ke1y8f6PTD0C7g9oh03o7pVI4UiX5pFWWKeW1YKsEHqc3E1n8glwR3oRvWpurKQeOKxtX79uw7DccxV-SFpk~dsxZ2yduqEVaRxmrX3x2Px9-Bc1ZjvEQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
          ),
        ),
      ),
    );
  }
}
