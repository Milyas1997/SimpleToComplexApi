import 'package:complexjsonhandling/jsonprovider/json_provider.dart';
import 'package:complexjsonhandling/model/json_two_model.dart';
import 'package:flutter/material.dart';

class JsonTwoScreen extends StatefulWidget {
  const JsonTwoScreen({super.key});

  @override
  State<JsonTwoScreen> createState() => _JsonTwoScreenState();
}

class _JsonTwoScreenState extends State<JsonTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: JsonProvider.jsonUserGetter(),
              builder: (context, AsyncSnapshot<List<JsonTwoModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(20)),
                          height: 130,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 20,
                                    child: Text(
                                      JsonProvider.userList[index].id
                                          .toString(),
                                    ),
                                  ),
                                  Text(
                                    JsonProvider.userList[index].name
                                        .toString(),
                                  ),
                                  Text(
                                    JsonProvider.userList[index].address!.city
                                        .toString(),
                                  )
                                ],
                              ),
                              const Divider(
                                color: Colors.red,
                                thickness: 2,
                              ),
                              Text(
                                JsonProvider.userList[index].company!.name
                                    .toString(),
                              ),
                              Text(
                                JsonProvider
                                    .userList[index].company!.catchPhrase
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
