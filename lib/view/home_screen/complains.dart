import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplainsView extends StatefulWidget {
  const ComplainsView({super.key});

  @override
  State<ComplainsView> createState() => _ComplinState();
}

class _ComplinState extends State<ComplainsView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Complaint".tr,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 30,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(70),
          child: Form(
            key: formKey,
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "email required".tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'email'.tr,
                    prefixIcon: const Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name is required".tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'name'.tr,
                    prefixIcon: const Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "phone required".tr;
                    } else if (value.length < 11) {
                      return "phone length".tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'phone'.tr,
                    prefixIcon: const Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please write your complaint".tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Complaint'.tr,
                    prefixIcon: const Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: const Color(0xff609FD8),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.7,
                      MediaQuery.of(context).size.height * 0.06,
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // ignore: avoid_print
                      print("done");
                    }
                  },
                  child: Text(
                    "Send".tr,
                    style: GoogleFonts.lalezar(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
