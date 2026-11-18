
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_flutter/controller/detailecommers_controller.dart';



class DetailecommersPages extends StatelessWidget {
  DetailecommersPages({super.key});

  final DetailEcommerceController controller =
      Get.put(DetailEcommerceController());

  String rupiah(double angka) {
    return 'Rp ${angka.toStringAsFixed(0)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Barang'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Center(
              child: Icon(
                Icons.shopping_bag,
                size: 100,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              controller.namaProduk,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              rupiah(controller.harga),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.tambahBarang();
                },
                child: const Text('Tambah Barang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
