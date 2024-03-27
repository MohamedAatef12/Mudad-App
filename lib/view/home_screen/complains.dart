import 'package:flutter/material.dart';

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
          title: const Text(
            "شكوى",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
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
                      return "برجاء ادخال بريدك الالكتروني";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'email',
                    prefixIcon: Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "برجاء ادخال اسمك";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "رقم الهاتف مطلوب";
                    } else if (value.length < 11) {
                      return "يجب ان يكون رقم الهاتف 11 رقم";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    prefixIcon: Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "برجاء كتابه شكوتك";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'الشكوى',
                    prefixIcon: Icon(Icons.verified_user_outlined),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
      
                    }
                  },
                  child: const Text('ارسال'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('الغاء')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}