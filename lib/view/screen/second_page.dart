import 'package:final_exam_flutter/helper/api_helper.dart';
import 'package:final_exam_flutter/model/reqres_model.dart';
import 'package:flutter/material.dart';

class Second_Screen extends StatefulWidget {
  const Second_Screen({super.key});

  @override
  State<Second_Screen> createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  late Future<RequresModel?> getApi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi = APIHelper.apiHelper.fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Calling"),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: getApi,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            RequresModel? data = snapshot.data;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: data?.data.length,
                    itemBuilder: (context, i) => Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Container(
                            // height: 220,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(data?.data[i]['avatar']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              data?.data[i]['first_name'],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              data?.data[i]['last_name'],
                            ),
                          ],
                        ),
                        title: Text(
                          data?.data[i]['email'],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
