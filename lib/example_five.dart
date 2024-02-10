import 'dart:convert';

import 'package:api_learning/models/products_model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFive extends StatefulWidget {
  const ExampleFive({super.key});

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {
  @override
  Widget build(BuildContext context) {
    Future<ProductsModel> getProductsApi() async {
      final response = await http.get(Uri.parse(
          'https://webhook.site/89c3d572-248e-47e2-864f-ac40da0d5cb6'));
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        return ProductsModel.fromJson(data);
      } else {
        return ProductsModel.fromJson(data);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Example Five',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder<ProductsModel>(
                    future: getProductsApi(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(snapshot
                                        .data!.data![index].shop!.name
                                        .toString()),
                                    subtitle: Text(snapshot
                                        .data!.data![index].shop!.shopaddress
                                        .toString()),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot
                                          .data!.data![index].shop!.image
                                          .toString()),
                                    ),
                                  ),
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3,
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data?.data?[index]
                                                  .images?.length ??
                                              0,
                                          itemBuilder: (context, position) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .25,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .5,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .images![
                                                                    position]
                                                                .url
                                                                .toString()))),
                                              ),
                                            );
                                          }))
                                ],
                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
