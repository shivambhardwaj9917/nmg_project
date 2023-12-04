import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmg_project/app/modules/post_details/post_controller.dart';

class PostPage extends StatelessWidget {
   PostPage({super.key});
  final DataController1 dataController = Get.put(DataController1());

  @override
  Widget build(BuildContext context) {
    String data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Post",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Obx(
              () {
            if (dataController.isLoading.value) {
              return const CircularProgressIndicator();
            } else if (dataController.responseData.isNotEmpty) {
              var dataList=[];
              for (var abc in dataController.responseData) {
                if (abc['userId']==int.parse(data))
                 dataList.add(abc);
              }

              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: dataList.length,
                itemBuilder: (context, index) {

                  final item = dataList[index];
                  return InkWell(
                    onTap: (){

                    },
                    child: Card(
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Id: ${item['id'].toString()}",style: const TextStyle(color: Colors.red,fontSize: 20),),
                              const SizedBox(height: 7,),
                              Text("UserId: ${item['userId'].toString()}",style: const TextStyle(color: Colors.red,fontSize: 17),),
                              const SizedBox(height: 7,),
                              Text("Title: ${item['title'].toString()}", style: const TextStyle(fontSize: 16),),
                              const SizedBox(height: 7,),
                              Text("Body: ${item['body'].toString()}", style: const TextStyle(fontSize: 16)),
                              //Text(item['id'].toString())
                            ],
                          ),
                        )
                    ),
                  );
                },
              );
            } else {
              return const Text('Press the button to fetch data');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          // print("aaaaa${dataController.responseData.length}");
          dataController.fetchData();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
