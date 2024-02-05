import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_fakeapi/Providers/data_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final data=ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
        centerTitle: true,
      ),
      body: data.when(
          data: (data){
            return ListView.builder(
              itemCount: data.length,
                itemBuilder: (context,index){
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                     color: Colors.blue.withOpacity(0.2),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Id: ${data[index].id}"),
                          Text("Name: ${data[index].name}"),
                          Text("Username: ${data[index].username}"),
                          Text("Email: ${data[index].email}"),
                          Text("Phone: ${data[index].phone}"),
                          Text("City: ${data[index].address.city}"),
                          Text("Company: ${data[index].company.name}"),
                          Text("Website: ${data[index].website}"),
                        ],
                      ),
                    )
                  );
                });
          },
          error: (error,s){
            Text(error.toString());
          },
          loading: (){
            CircularProgressIndicator();
          }),

    );
  }
}
