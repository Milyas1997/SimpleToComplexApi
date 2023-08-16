import 'package:complexjsonhandling/jsonprovider/json_provider.dart';
import 'package:complexjsonhandling/model/json_three_model.dart';
import 'package:flutter/material.dart';

class JsonThreeScreen extends StatefulWidget {
  const JsonThreeScreen({super.key});

  @override
  State<JsonThreeScreen> createState() => _JsonThreeScreenState();
}

class _JsonThreeScreenState extends State<JsonThreeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<List<JsonThreeModel>>(
              future: JsonProvider.jsonPostGetterTwo(),
              builder: (context, AsyncSnapshot<List<JsonThreeModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: JsonProvider.postListtwo.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.blue,
                                child: Text(JsonProvider
                                    .postListtwo[index].postId
                                    .toString()),
                              ),
                              title: Text(JsonProvider.postListtwo[index].body
                                  .toString()),
                              subtitle: Text(JsonProvider
                                  .postListtwo[index].email
                                  .toString()),
                            ),
                            const Divider(
                              color: Colors.blue,
                              thickness: 2,
                            ),
                          ],
                        );
                      });
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
