
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_flutter/Models/dataAPI_model.dart';


class PremierLeagueController extends GetxController {
  
  final String baseUrl =
      'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League';

  var teams = <Team>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeams();
  }


  Future<void> fetchTeams() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await http.get(
        Uri.parse(baseUrl),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData =
            json.decode(response.body);

        final premierLeague =
            PremierLeagueModel.fromJson(jsonData);

        teams.assignAll(premierLeague.teams);
      } else {
        errorMessage.value =
            'Gagal mengambil data: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshTeams() async {
    await fetchTeams();
  }
}
