
import 'package:get/get.dart';

class EcommersController extends GetxController {

  final List<Map<String, dynamic>> listProduk = [
    {'nama': 'Nasi Goreng Special', 'harga': 25000.0},
    {'nama': 'Ayam Bakar Madu', 'harga': 30000.0},
    {'nama': 'Sate Madura', 'harga': 28000.0},
    {'nama': 'Mie Ayam Bakso', 'harga': 20000.0},
    {'nama': 'Es Teh Manis Jumbo', 'harga': 8000.0},
  ];

  var keranjang = <Map<String, dynamic>>[].obs;

  double get subtotal {
    double hasil = 0;

    for (var produk in keranjang) {
      hasil += (produk['harga'] as num).toDouble();
    }

    return hasil;
  }

  double get diskon {
    if (subtotal > 100000) {
      return subtotal * 10 / 100;
    }

    return 0;
  }

  double get setelahDiskon {
    return subtotal - diskon;
  }

  double get ppn {
    return setelahDiskon * 5 / 100;
  }

  double get total {
    return setelahDiskon + ppn;
  }

  void tambahKeranjang(Map<String, dynamic> produk) {
    keranjang.add(produk);
  }

  void hapusKeranjang(int index) {
    keranjang.removeAt(index);
  }
}
