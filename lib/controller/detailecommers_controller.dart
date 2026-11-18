
import 'package:get/get.dart';
import 'package:pas_flutter/controller/ecommers_controller.dart';


class DetailEcommerceController extends GetxController {

  late String namaProduk;
  late double harga;

  final transactionController =
      Get.find<EcommersController>();

  @override
  void onInit() {
    super.onInit();

    final arguments =
        Map<String, dynamic>.from(Get.arguments as Map);

    namaProduk = arguments['nama'].toString();
    harga = (arguments['harga'] as num).toDouble();
  }

  void tambahBarang() {
    transactionController.tambahKeranjang({
      'nama': namaProduk,
      'harga': harga,
    });

    Get.snackbar(
      'Berhasil',
      '$namaProduk berhasil ditambahkan',
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.back();
  }
}
