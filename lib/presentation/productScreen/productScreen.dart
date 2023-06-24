import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:inova_task/widgets/appbar_widget.dart';
import '../../core/constants/appRoute.dart';
import '../../core/constants/strings.dart';
import '../../core/service/notificationhelper.dart';
import '../../data/models/ProductDataModel.dart';
import '../../data/repository/ProductDataRepository.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../../widgets/search_widget.dart';
import '../../widgets/trialButton.dart';
import 'Controller/productScreenController.dart';

class MyHomePage extends StatefulWidget {
  static const routename = AppRoute.productRoute;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//just for show abstract class
class _MyHomePageState extends ProductScreenContoller {
  ProductRepository productRepository = new ProductRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();

    NotificationService()
        .showNotification(2, AppStrings.inovaTask, AppStrings.feedback, 1);
    NotificationService()
        .showNotification(1, AppStrings.inovaTask, AppStrings.contactMe, 1);

    NotificationService()
        .showNotification(3, AppStrings.inovaTask, AppStrings.niceday, 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(
            title: AppStrings.products, iconButton: Icon(Icons.sync)),
        body: FutureBuilder(
          // TODO: implement initState

          future: productRepository.ReadJsonData(),

          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<ProductDataModel>;
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          key: Key("Row"),
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              key: Key("ContainerimageURL"),
                              width: 50,
                              height: 50,
                              child: Image(
                                image: NetworkImage(
                                    items[index].imageURL.toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              key: Key("Containerdata"),
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      items[index].name.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 8, right: 8),
                                    child:
                                        Text(items[index].price.toString()),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
