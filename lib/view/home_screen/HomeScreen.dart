import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mudad_app/view/drawer/drawer.dart';

import 'Home_viewModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GlobalKey<ScaffoldState> _scaffoldKey;
  var instance = HomeVm();
  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: const HomeDrawer(),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: Align(
                alignment: const Alignment(0, -1),
                child: InkWell(
                    onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
                    child: Image.asset("assets/Menu.png")),
              ),
            ),
          ],
          toolbarHeight: MediaQuery.of(context).size.height / 3,
          flexibleSpace: instance.models
              .imageBar(context: context, image: instance.appBarImage),
        ),
        body: Column(
          children: [
            //main button
            instance.models.mainButton(
              context: context,
              color: instance.mainButtonColor,
              onTap: () {
                if (instance.selectedButton == "") {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "يرجي تحديد نوع التبرع أولاً",
                              style: GoogleFonts.aboreto(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                "اعادة المحاولة",
                                style: GoogleFonts.lalezar(
                                    fontSize: 20,
                                    color:
                                        const Color.fromRGBO(0, 117, 223, 100),
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  instance.mainButtonOnTap();
                }
              },
              style: instance.textStyleForMainButton,
              title: instance.titles[0],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 160,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  children: [
                    instance.models.imageButton(
                      instance.selectedButton,
                      title: instance.titles[2],
                      style: instance.textStyleForButtons,
                      image: instance.images[0]["houses"],
                      onTap: () => setState(() {
                        instance.forHomeOnTap();
                      }),
                    ),
                    instance.models.imageButton(
                      instance.selectedButton,
                      title: instance.titles[1],
                      style: instance.textStyleForButtons,
                      image: instance.images[0]["mosques"],
                      onTap: () => setState(() {
                        instance.forMosqueOnTap();
                      }),
                    ),
                    instance.models.imageButton(
                      instance.selectedButton,
                      title: instance.titles[3],
                      style: instance.textStyleForButtons,
                      image: instance.images[0]["orphanage"],
                      onTap: () => setState(() {
                        instance.forOrphanageOnTap();
                      }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        // floatingActionButton: instance.models.floatingButton(
        //   onPressed: instance.floatingActionButtonOnpress,
        //   child: Image.asset(
        //     instance.floatingActionButtonImage,
        //     fit: BoxFit.fill,
        //   ),
        // )
      ),
    );
  }
}
