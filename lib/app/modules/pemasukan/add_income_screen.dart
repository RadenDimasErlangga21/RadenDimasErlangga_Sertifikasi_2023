// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, deprecated_member_use, duplicate_ignore, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cash_book/app/utility/app_color.dart';
import 'package:my_cash_book/app/widgets/custom_input.dart';
import 'add_income_controller.dart';

// ignore: must_be_immutable
class AddIncomeScreen extends GetView<AddIncomeController> {
  late double mWidth;
  late double mHeight;

  @override
  Widget build(BuildContext context) {
    // Mengambil lebar dan tinggi layar
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height / 1.2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 221, 18),
        title: const Text('Tambah Pemasukan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: mHeight,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Input field untuk memasukkan tanggal
                  CustomInput(
                    controller: controller.dateC,
                    label: "Tanggal",
                    hint: "Pilih tanggal",
                    suffixIcon: const Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                    isDate: true,
                  ),
                  
                  // Input field untuk memasukkan nominal
                  CustomInput(
                    controller: controller.nominalC,
                    label: "Nominal",
                    hint: "Masukkan nominal",
                    isNumber: true,
                    isNominal: true,
                  ),
                  
                  // Input field untuk memasukkan keterangan
                  CustomInput(
                    controller: controller.descriptionC,
                    label: "Keterangan",
                    hint: "Masukkan keterangan",
                  ),
                ],
              ),
              
              // Tombol reset formulir
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.isLoading.isFalse) {
                      await controller.resetForm();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    elevation: 0,
                    primary: AppColor.warning,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 10),
              
              Obx(
                () => Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (controller.isLoading.isFalse) {
                        await controller.addIncome();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      primary: AppColor.greenbutton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      (controller.isLoading.isFalse) ? 'Simpan' : 'Loading...',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 10),
              
              // Tombol kembali ke layar sebelumnya
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    elevation: 0,
                    primary: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    '<< Kembali',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
