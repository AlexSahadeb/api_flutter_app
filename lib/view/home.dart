import 'package:api_app/helper/api_service.dart';
import 'package:api_app/model/post.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel>? posts;

  bool isloaded = false;

  getData() async {
    posts = await PostHelper().getPost();
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView.builder(
                itemCount: posts?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 10,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        posts![index].id.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 10),
                                  child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.deepPurple),
                                      child: Center(
                                          child: Text(
                                        posts![index].userId.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                )
                              ],
                            ),
                            Text(
                              posts![index].title,
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 30),
                            ),
                            Text(
                              posts![index].body,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.deepPurpleAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })));
  }
}
