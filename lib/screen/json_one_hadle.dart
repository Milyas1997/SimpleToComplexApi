import 'package:complexjsonhandling/jsonprovider/json_provider.dart';
import 'package:complexjsonhandling/model/json_one_model.dart';
import 'package:flutter/material.dart';

class JsonOneHandle extends StatefulWidget {
  const JsonOneHandle({super.key});

  @override
  State<JsonOneHandle> createState() => _JsonOneHandleState();
}

class _JsonOneHandleState extends State<JsonOneHandle> {
  @override
  void initState() {
    super.initState();

    //debugPrint('ARRAYLIST LENGTH ARE: ${JsonProvider.postList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: JsonProvider.jsonPostGetter(),
              builder: (context, AsyncSnapshot<List<JsonOneModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: JsonProvider.postList.length,
                      itemBuilder: (contex, index) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListTile(
                              subtitle: Text(
                                  'User Id:${JsonProvider.postList[index].userId.toString()}'),
                              leading: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.blue,
                                child: Center(
                                    child: Text(
                                  JsonProvider.postList[index].id.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              title: Text(JsonProvider.postList[index].title
                                  .toString()),
                            ),
                          );
                        }

                        return const Text('loading...');
                      });
                }

                return const Center(child: CircularProgressIndicator());
              })),
    );
  }
}
