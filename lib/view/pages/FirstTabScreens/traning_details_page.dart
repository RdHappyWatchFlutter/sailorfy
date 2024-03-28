import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/model/active_training_list_model.dart';

import 'thank_you_interest.dart';

class TraningDetailsPage extends StatefulWidget {
  final ActiveTrainingList activeTrainingList;
  const TraningDetailsPage(
    this.activeTrainingList, {
    super.key,
  });

  @override
  State<TraningDetailsPage> createState() => _TraningDetailsPageState();
}

class _TraningDetailsPageState extends State<TraningDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              color: Colors.yellow,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: CachedNetworkImageProvider(
              //             'https://sailorfy.searchosis.com${widget.activeTrainingList.pic}'),
              //         fit: BoxFit.cover,
              //         onError: (obj, stk) {
              //           Center();
              //         })),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.activeTrainingList.fullName,
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold, height: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 15),
                    child: Row(
                      children: [
                        Icon(Icons.house_outlined),
                        Text(
                          widget.activeTrainingList.instituteName,
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
