import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mudad_app/app_constants/app_assets.dart';
import 'package:mudad_app/app_constants/app_colors.dart';
import 'package:mudad_app/app_constants/app_text_styles.dart';
import 'package:mudad_app/google_maps/mosque_map/search_map.dart';
import 'package:mudad_app/view/drawer/drawer.dart';
import 'package:mudad_app/view_model/services_cubit/services_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List navigationPages = [
    const SearchMap(),
    const SearchMap(),
    const SearchMap(),
  ];

  Widget? selectedPage;
  final selectedImage = ''.obs;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> returnedServices = [];
  List<String> returnedImages = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const HomeDrawer(),
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * .2,
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Image.asset(AppAssets.menu),
                  ),
                ),
              ],
            ),
          ),
          toolbarHeight: MediaQuery.of(context).size.height * .3,
          automaticallyImplyLeading: false,
          flexibleSpace: Image.asset(
            "assets/AppBar.jpg",
            fit: BoxFit.cover,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Services".tr,
              style: GoogleFonts.lalezar(
                  color: AppColors.buttonColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w200),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocProvider(
              create: (context) => ServicesCubit()..loadServices(),
              child: BlocConsumer<ServicesCubit, ServicesState>(
                listener: (context, state) {
                  if (state is ServicesSuccess) {
                    returnedServices = state.services;
                    returnedImages = state.images;
                  }
                },
                builder: (context, state) {
                  if (state is ServicesLoading) {
                    return const Expanded(
                      child: SpinKitFadingCircle(
                        color: AppColors.buttonColor,
                        size: 50,
                      ),
                    );
                  } else {
                    return Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: returnedImages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Obx(
                            () {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: selectedImage.value ==
                                              returnedImages[index]
                                          ? Colors.transparent
                                          : Colors.grey.withOpacity(.2),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    color: selectedImage.value ==
                                            returnedImages[index]
                                        ? AppColors.buttonColor.withOpacity(.35)
                                        : Colors.grey.withOpacity(.05),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      selectedImage.value =
                                          returnedImages[index];
                                      selectedPage = navigationPages[index];
                                    },
                                    child: Column(
                                      children: [
                                        Image.network(
                                          returnedImages[index],
                                          fit: BoxFit.cover,
                                        ),
                                        Text(
                                          returnedServices[index],
                                          style: GoogleFonts.lalezar(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                onTap: () async {
                  if (selectedImage.value == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please choose a service".tr,
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => selectedPage!));
                  }
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: MediaQuery.of(context).size.height * .07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.buttonColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Choose Service".tr,
                        style: AppTextStyle.mainFont,
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
          ],
        ),
      ),
    );
  }
}
