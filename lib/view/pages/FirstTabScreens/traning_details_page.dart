import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:salorify/controller/dashboard_controller.dart';

import 'thank_you_interest.dart';

class TraningDetailsPage extends StatefulWidget {
  final String number;
  const TraningDetailsPage({super.key, required this.number});

  @override
  State<TraningDetailsPage> createState() => _TraningDetailsPageState();
}

class _TraningDetailsPageState extends State<TraningDetailsPage> {
  final DashBoardController dashBoardController = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: dashBoardController.getActiveTrainingList(),
        builder: (context,AsyncSnapshot<List<dynamic>> response) {
          if(!response.hasData || response.hasError){
            return LoadingAnimationWidget.prograssiveDots(color: Colors.black, size: 20.0);
          }else{
            final listData = response.data;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.yellow,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listData![0][''],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold, height: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 15),
                          child: Row(
                            children: [
                              Icon(Icons.house_outlined),
                              Text(
                                'Diploma in Nautical Science',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Welcome jkdfkj k  r kv kd k kf vjkder hgu hrrrteg  rfghiur fgirughfui fui faiuyer irufe aiewhf vdjbdj vjd kv dk vfdjbvkjdf vjkdf kv jkdf kv dkj vk dfk v dkj v vkd kv d kv dk vd kd vkd kd kf  fiew9gheri8gh t ihgiewhg',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                                width: 20,
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.check_circle)),
                            title: Text('Two-line ListTile'),
                            subtitle: Text(
                                'Here is a second line kjvbkjdfbvjk dfjv df v kvk,d fkvkjlfsd vjkl dfkjv kl,df vk dfkl, vk dfsk,v kdfs vk,df kv, dfk vkfdkv Here is a second line kjvbkjdfbvjk dfjv df v kvk,d fkvkjlfsd vjkl dfkjv kl,df vk dfkl, vk dfsk,v kdfs vk,df kv, dfk vkfdkv '),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                                width: 20,
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.check_circle)),
                            title: Text('Two-line ListTile'),
                            subtitle: Text(
                                'Here is a second line kjvbkjdfbvjk dfjv df v kvk,d fkvkjlfsd vjkl dfkjv kl,df vk dfkl, vk dfsk,v kdfs vk,df kv, dfk vkfdkv Here is a second line kjvbkjdfbvjk dfjv df v kvk,d fkvkjlfsd vjkl dfkjv kl,df vk dfkl, vk dfsk,v kdfs vk,df kv, dfk vkfdkv '),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                                width: 20,
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.check_circle)),
                            title: Text('Two-line ListTile'),
                            subtitle: Text(
                                'Here is a second line kjvbkjdfbvjk dfjv df v kvk,d fkvkjlfsd vjkl dfkjv kl,df vk dfkl, vk dfsk,v kdfs vk,df kv, dfk vkfdkv Here is a second line kjvbkjdfbvjk dfjv df v kvk,d fkvkjlfsd vjkl dfkjv kl,df vk dfkl, vk dfsk,v kdfs vk,df kv, dfk vkfdkv '),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        }
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ThankYouInterest(),
            ),
          );
        },
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 10),
          height: 70,
          color: Colors.red.shade700,
          child: Text(
            'Enroll Now',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
