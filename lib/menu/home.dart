
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_flutter/controller/ecommers_controller.dart';



import '../routes.dart';

class HomePages extends StatelessWidget {
  HomePages({super.key});

  final EcommersController controller =
      Get.put(EcommersController());

  String rupiah(double angka) {
    return 'Rp ${angka.toStringAsFixed(0)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text(
            'Daftar Barang',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

        
          ...controller.listProduk.map((produk) {
            return Card(
              child: ListTile(
                title: Text(produk['nama'].toString()),
                subtitle: Text(
                  rupiah(
                    (produk['harga'] as num).toDouble(),
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),

                onTap: () {
                  Get.toNamed(
                    Routes.detailecommerce,
                    arguments: produk,
                  );
                },
              ),
            );
          }),

          const Divider(height: 30),

          const Text(
            'Keranjang Belanja',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          
          Obx(() {
            if (controller.keranjang.isEmpty) {
              return const Text(
                'Belum ada barang ditambahkan',
                style: TextStyle(color: Colors.grey),
              );
            }

            return Column(
              children: controller.keranjang
                  .asMap()
                  .entries
                  .map((entry) {
                int index = entry.key;
                var produk = entry.value;

                return Card(
                  child: ListTile(
                    title: Text(produk['nama'].toString()),
                    subtitle: Text(
                      rupiah(
                        (produk['harga'] as num).toDouble(),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        controller.hapusKeranjang(index);
                      },
                    ),
                  ),
                );
              }).toList(),
            );
          }),

          const Divider(height: 30),

          const Text(
            'Rincian Pembayaran',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Jumlah Barang: ${controller.keranjang.length}',
                ),

                Text(
                  'Subtotal: ${rupiah(controller.subtotal)}',
                ),

                const SizedBox(height: 10),

                Text(
                  'Total Pembayaran: ${rupiah(controller.total)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
