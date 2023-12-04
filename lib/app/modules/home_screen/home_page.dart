import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmg_project/app/modules/login_screen/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
   final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text("Authors",style: TextStyle(color: Colors.white),),
      ),
      drawer: SideMenu(),
      body: Center(
        child: Obx(
              () {
            if (dataController.isLoading.value) {
              return const CircularProgressIndicator();
            } else if (dataController.responseData.isNotEmpty) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: dataController.responseData.length,
                itemBuilder: (context, index) {
                  final item = dataController.responseData[index];
                  return InkWell(
                    onTap: (){
                      String data = item['id'].toString();
                      Get.toNamed('/post', arguments: data);
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
                            Text("Name: ${item['name'].toString()}", style: const TextStyle(fontSize: 16),),
                            const SizedBox(height: 7,),
                            Text("Username: ${item['username'].toString()}", style: const TextStyle(fontSize: 16),),
                            const SizedBox(height: 7,),
                            Text("Email: ${item['email'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            const Text("Address:", style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text("Street: ${item['address']['street'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text("Suite: ${item['address']['suite'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text("City: ${item['address']['city'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text("Zipcode: ${item['address']['zipcode'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text("Lat: ${item['address']['geo']['lat'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text("Long: ${item['address']['geo']['lng'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text("Phone: ${item['phone'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text("Website: ${item['website'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text("Company name: ${item['company']['name'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text("Company catchPhrase: ${item['company']['catchPhrase'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text("Company bs: ${item['company']['bs'].toString()}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),

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
          dataController.fetchData();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

}


class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xff764abc)),
            accountName: const Text('Shivam Bhardwaj'),
            accountEmail: const Text("s.bhardwaj3112@gmail.com"),
            currentAccountPicture: InkWell(
              onTap: (){
              },
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.manage_accounts_sharp,color: Colors.white,),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.document_scanner_outlined),
            title: const Text('Home'),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              logout();
            },
          ),

        ],
      ),
    );
  }
  Future<void> logout() async {
    // Clear login status in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigate to the login page
    Get.to(LoginScreen());
  }
}
