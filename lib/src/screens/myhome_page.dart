import 'package:fluter_api/api/api.dart';
import 'package:fluter_api/models/photos_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<Photos>>(
            future: api.getFoto(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Photos>> snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext contex, int index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(snapshot.data![index].thumbnailUrl),
                             ),
                          title: Text(snapshot.data![index].title.toString()),
                          subtitle: Text("Resultado del Albun ${snapshot.data![index].id}"),
                          ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })
        );
  }

}
