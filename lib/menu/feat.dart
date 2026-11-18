import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_flutter/controller/dataAPI_controller.dart';

class FeatPages extends StatelessWidget {
  FeatPages({super.key});

  final controller = Get.put(PremierLeagueController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        title: const Text(
          "Football Leagues",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF3949AB),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Container(
        margin: const EdgeInsets.all(12),

        child: Obx(() {

          if (controller.isLoading.value &&
              controller.teams.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF3949AB),
              ),
            );
          }

          if (controller.teams.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.sports_soccer,
                    size: 60,
                    color: Colors.grey,
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Data liga belum tersedia",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: controller.fetchTeams,
                    child: const Text("Muat Ulang"),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: controller.fetchTeams,

            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),

              itemCount: controller.teams.length,

              itemBuilder: (context, index) {

                final pertandingan =
                    controller.teams[index];

                return Dismissible(
                  key: ValueKey(pertandingan.idTeam),

                  direction: DismissDirection.startToEnd,

                  background: Container(
                    margin: const EdgeInsets.only(bottom: 16),

                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    alignment: Alignment.centerLeft,

                    padding: const EdgeInsets.only(left: 20),

                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),

                  onDismissed: (direction) {

                    controller.teams.removeAt(index);

                    Get.snackbar(
                      "Liga Dihapus",
                      "Data liga berhasil dihapus dari daftar",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(12),
                    );

                  },

                  child: Card(
                    margin: const EdgeInsets.only(bottom: 16),

                    elevation: 4,

                    shadowColor: Colors.black12,

                    color: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(12),

                      child: Row(
                        children: [

                          // ICON FOOTBALL
                          Container(
                            width: 100,
                            height: 100,

                            decoration: BoxDecoration(
                              color: const Color(0xFFE8EAF6),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            child: const Icon(
                              Icons.sports_soccer,
                              size: 55,
                              color: Color(0xFF3949AB),
                            ),
                          ),

                          const SizedBox(width: 16),

                          // DETAIL LIGA
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                Text(
                                  pertandingan.strTeam,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,

                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF263238),
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  "Season: ${pertandingan.strStadium}",

                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF3949AB),
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  "Shortcut: ${pertandingan.strBadge}",

                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.sports,
                                      size: 15,
                                      color: Colors.grey,
                                    ),

                                    const SizedBox(width: 4),

                                  ],
                                ),

                              ],
                            ),
                          ),

                          const SizedBox(width: 8),

                          Container(
                            padding: const EdgeInsets.all(8),

                            decoration: BoxDecoration(
                              color: const Color(0xFFE8EAF6),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Color(0xFF3949AB),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
