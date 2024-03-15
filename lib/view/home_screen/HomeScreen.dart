import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mudad_app/google_maps/orphanage_map/orphanage_map.dart';
import 'package:mudad_app/view/drawer/drawer.dart';
import 'package:mudad_app/view_model/services_cubit/services_cubit.dart';
import '../../app_constants/app_assets.dart';
import '../../app_constants/app_colors.dart';
import '../../app_constants/app_text_styles.dart';
import '../../google_maps/home_map/choose_location.dart';
import '../../google_maps/mosque_map/search_map.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'assets/mosques.png',
    'assets/houses.png',
    'assets/orphanage.png'
  ];

  final List navigationPages = [
    const SearchMap(),
    const ChooseLocation(),
    const OrphanageMap()
  ];

  var selectedPage;
  final selectedImage = ''.obs;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> returnedServices = [];
  List<String> returnedImages = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          endDrawer: const HomeDrawer(),
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * .4,
            automaticallyImplyLeading: false,
            flexibleSpace: Image.asset(
              "assets/AppBar.jpg",
              fit: BoxFit.fill,
            ),
            actions: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      },
                      child: Image.asset(AppAssets.menu),
                    ),
                  ),
                ],
              )
            ],
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: InkWell(
                onTap: () async {
                  //
                  // print(servicesCubit.services);
                  if (selectedImage.value == "") {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "يرجي اختيار خدمه",
                        textDirection: TextDirection.rtl,
                      ),
                    ));
                  } else {
                    Get.to(selectedPage);
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
                      child: Text("اختيار الخدمه",
                          style: AppTextStyle.mainFont,
                          textAlign: TextAlign.center),
                    )),
              ),
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
                    return const CircularProgressIndicator();
                  } else {
                    return Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: returnedServices.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 70.0,
                                childAspectRatio: .8),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    selectedImage.value = returnedImages[index];
                                    selectedPage = navigationPages[index];
                                  },
                                  child: Obx(() {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: selectedImage.value ==
                                                  images[index]
                                              ? AppColors.buttonColor
                                              : Colors.transparent,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Image.network(
                                        returnedImages[index],
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              Text(
                                returnedServices[index],
                                style: const TextStyle(
                                    color: AppColors.buttonColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            )
          ])

          // },

          ),
    );
  }
}

//Expanded(
//                             child: ListView.builder(
//                                 itemCount: servicesCubit.services.length,
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) {
//                                   return Text(
//                                     servicesCubit.services[index],
//                                     style: const TextStyle(
//                                         color: AppColors.buttonColor,
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.w900),
//                                   );
//                                 }));
