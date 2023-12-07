// import 'package:flutter/material.dart';

// class AddChildOrphanage extends StatelessWidget {
//   const AddChildOrphanage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:orphanagemanagement/model/other/child_detail_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';

class AddChildOrphanage extends StatefulWidget {
  AddChildOrphanage({super.key});

  @override
  State<AddChildOrphanage> createState() => _AddChildOrphanageState();
}

class _AddChildOrphanageState extends State<AddChildOrphanage> {
  TabController? tabcroller;
  FireStore fireStore = FireStore();
  TextFormField name = TextFormField();
  TextFormField nickname = TextFormField();
  TextFormField age = TextFormField();

  TextFormField birthDay = TextFormField();
  TextFormField birthMonth = TextFormField();
  TextFormField birthYear = TextFormField();

  TextFormField joinday = TextFormField();
  TextFormField joinmonth = TextFormField();
  TextFormField joinYear = TextFormField();

  TextFormField location = TextFormField();
  TextFormField bloodGroup = TextFormField();
  ///////
  TextFormField medicalStatus = TextFormField();
  TextFormField diseases = TextFormField();
  TextFormField disabilitiess = TextFormField();
  TextFormField hight = TextFormField();
  TextFormField weight = TextFormField();
  TextFormField medicines = TextFormField();

  String? selectedType;
  String? selectedStatus;
  String? gender;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Add Child Details"),
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: appThemeGrey,
                    width: width * .28,
                    height: hight * .1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          "https://s3-alpha-sig.figma.com/img/24ab/5518/d7c0717b33be2972fd5961a68ce64f6e?Expires=1702252800&Signature=QjStQLGE6H1-jL06bmiCvIkvFBY-8juw~0A6DXUHDa9nuVRduEl8r23QR66krGJZllPEQQ4eKErKkkwL1-WWXZfiI~WxpPj-9eoNPZ-OV~CV1xLgJP1p8Ot6DfgtqVyiQoTYudkaQcPi0z1ctcCsbL~evX7i1MANITbXZhdhYXVSYtSNCMxH7BUS-vWlVzAuabbLF9khL7qeDvHAr9bMTFi3d0vceL2nVsmI2m5MNGQ1lvk59an4~1vBwjzjAjeekrjiGwLvllsCGZbMDQeIf9wE7aE4QaR1BcmD4IEzDyxMZiKL0BFeBhL8YcK-L2n1zChGZ7NJBxu6olSZPR9jow__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                          scale: 1.5,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: black,
                              ),
                              width: width * .28,
                              height: hight * .03,
                              child: Center(
                                child: customeText(
                                    text: "Add Image", textcolor: white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 480,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customeText(text: "Name", size: 16),
                              customeText(text: "Nick Name.", size: 16),
                              customeText(text: "Age", size: 16),
                              customeText(text: "Gender", size: 16),
                              customeText(text: "Birth Date", size: 16),
                              customeText(text: "Joined Date", size: 16),
                              customeText(text: "Known location", size: 16),
                              customeText(text: "Bkood Group", size: 16),
                              customeText(text: "Orphan Type", size: 16),
                              customeText(text: "Ready For Adoption", size: 16),
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
                              seperatorText,
                              seperatorText,
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
                              BlankTextField(context: context, hintText: ""),
                              BlankTextField(context: context, hintText: ""),
                              BlankTextField(context: context, hintText: ""),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(50)),
                                // color: grey600,
                                height: 30,
                                // width: 100,
                                child: TabBar(
                                    onTap: (index) {
                                      if (index == 0) {
                                        gender = "Female";
                                      } else {
                                        gender = "Male";
                                      }
                                    },
                                    // indicatorWeight: 0,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    isScrollable: true,
                                    labelColor: white,
                                    labelPadding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10), // Creates border
                                        color: black),
                                    unselectedLabelColor: Colors.black,
                                    tabs: [
                                      customeText(text: "Feamle"),
                                      customeText(text: "Male")
                                    ]),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BlankTextField(
                                    fielSize: 40,
                                    context: context,
                                    hintText: "Day",
                                  ),
                                  customeText(text: "/", textcolor: grey600),
                                  BlankTextField(
                                      fielSize: 40,
                                      context: context,
                                      hintText: "Date"),
                                  customeText(text: "/", textcolor: grey600),
                                  BlankTextField(
                                      fielSize: 40,
                                      context: context,
                                      hintText: "Year"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BlankTextField(
                                    fielSize: 40,
                                    context: context,
                                    hintText: "Day",
                                  ),
                                  customeText(text: "/", textcolor: grey600),
                                  BlankTextField(
                                      fielSize: 40,
                                      context: context,
                                      hintText: "Date"),
                                  customeText(text: "/", textcolor: grey600),
                                  BlankTextField(
                                      fielSize: 40,
                                      context: context,
                                      hintText: "Year"),
                                ],
                              ),
                              // BlankTextField(
                              // context: context, hintText: "day/dat/year"),
                              BlankTextField(context: context, hintText: ""),
                              BlankTextField(context: context, hintText: ""),
                              DropdownButton<String>(
                                // style: GoogleFonts.jua(),
                                value: selectedType,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedType = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Maternal',
                                  'Patern',
                                  'Duble',
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: customeText(
                                          text: value, textcolor: grey600));
                                }).toList(),
                              ),
                              DropdownButton<String>(
                                // style: GoogleFonts.jua(),
                                value: selectedStatus,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedStatus = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Ready',
                                  "Can't adapt",
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: customeText(
                                          text: value, textcolor: grey600));
                                }).toList(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: appThemeGrey,
                      borderRadius: BorderRadius.circular(13)),
                  height: hight * .37,
                  child: Column(
                    children: [
                      Gap(10),
                      customeText(text: "Health Report", size: 17),
                      const Divider(
                        color: Black54,
                      ),
                      SizedBox(
                        height: 290,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customeText(text: "Medical Status", size: 16),
                                customeText(text: "Diseases", size: 16),
                                customeText(text: "Disabilities", size: 16),
                                customeText(text: "Hight", size: 16),
                                customeText(text: "Weight", size: 16),
                                customeText(text: "Medicines", size: 16),
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
                                seperatorText,
                                seperatorText,
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                BlankTextField(context: context, hintText: ""),
                                BlankTextField(context: context, hintText: ""),
                                BlankTextField(context: context, hintText: ""),
                                BlankTextField(context: context, hintText: ""),
                                BlankTextField(context: context, hintText: ""),
                                BlankTextField(context: context, hintText: ""),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                SizedBox(
                  width: width * .45,
                  height: hight * .05,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    child: customeText(
                        text: "Add Child", textcolor: white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  addchild(){
    // fireStore.addChildToFirestore(childDataRegModel)



  }
}
