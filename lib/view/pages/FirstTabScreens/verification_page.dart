import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/model/top_employers_list_model.dart';

class VerificationPage extends StatefulWidget {
  final String number;
  const VerificationPage({super.key, required this.number});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController _searchController = TextEditingController();
  final DashBoardController dashBoardController = Get.put(DashBoardController());

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.document_scanner_outlined,
                          size: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            'Verification',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.notifications_none_outlined,
                            size: 25,
                          ),
                        ),
                        Icon(
                          Icons.filter_list,
                          size: 25,
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50, // Set the desired height
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0), // Adjust vertical padding
                    ),
                    onChanged: (value) {
                      // Handle search query changes
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<TopEmployersList>>(
                future: dashBoardController.getTopEmployersList(),
                builder: (context, AsyncSnapshot<List<TopEmployersList>> response) {
                  if (!response.hasData || response.hasError) {
                    return ListView.builder(
                      itemCount: 2, // Example itemCount
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: LoadingAnimationWidget.prograssiveDots(color: Colors.orange, size: 20.0),
                          ),
                        );
                      },
                    );
                  } else {
                    final data = response.data;
                    return SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: data!.length >2 ? 2 : data.length, // Example itemCount
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 140,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Card(
                                  color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 120.0,
                                        width: 70.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: CachedNetworkImageProvider(
                                                    'https://sailorfy.searchosis.com' + '/files/inno.png' ),
                                                fit: BoxFit.cover,
                                                onError: (obj, stk) {
                                                  Center();
                                                }),
                                            border: Border.all(
                                                color: Colors.grey.shade100,
                                                width: 1.0)),
                                      ),
                                      SizedBox(width: 20.0),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data[index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                            Text(data[index].city),
                                            RatingBar.builder(
                                              initialRating: 1.0,
                                              minRating: 1,
                                              itemSize: 12,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemBuilder: (context, _) =>
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
