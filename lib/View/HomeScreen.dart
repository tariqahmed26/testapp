import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Controllers/ListConroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final listController = Get.put(ListController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listController.fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          leading: const Icon(Icons.home),
          title: const Text("Home Screen",
              style: TextStyle(color: Color(0xFF22113C))),
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Colors.white,
        body: GetX<ListController>(builder: (listController) {
          return listController.isLoading.value == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: listController.list.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    SizedBox(height: Get.height * 0.02),
                                    Container(
                                      width: Get.width * 0.9,
                                      height: 104.58,
                                      decoration: ShapeDecoration(
                                        color: Color.fromARGB(255, 22, 34, 44),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        shadows: const [
                                          BoxShadow(
                                            color: Color(0x19132B41),
                                            blurRadius: 20,
                                            offset: Offset(0, 5),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(height: Get.height * 0.01),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image(
                                              image: NetworkImage(
                                                  '${listController.list[index].url}'),
                                              height: 98,
                                              width: Get.width * 0.3,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.01,
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.1,
                                            width: Get.width * 0.5,
                                            child: ListTile(
                                              leading: ImageIcon(NetworkImage(
                                                  '${listController.list[index].thumbnailUrl}')),
                                              title: Text(
                                                '${listController.list[index].title}',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Inter'),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.002),
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
