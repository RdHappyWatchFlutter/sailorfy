import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:salorify/constant/bottom_bar.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/model/certificate_list_model.dart';

class CertificateList extends StatefulWidget {
  final String number;
  const CertificateList({super.key, required this.number});

  @override
  State<CertificateList> createState() => _CertificateListState();
}

class _CertificateListState extends State<CertificateList> {
  final DashBoardController dashBoardController = Get.put(DashBoardController());
  bool isDownloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue.shade50,
        centerTitle: true,
        title: const Text(
          'Certificates',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder<List<ActiveCertificateList>>(
          future: dashBoardController.getCertificateList(widget.number),
          initialData: [],
          builder: (context,AsyncSnapshot<List<ActiveCertificateList>> response) {
            if(!response.hasData || response.hasError){
              return  ListView.builder(
                itemCount: 20, // Example itemCount
                shrinkWrap: true,

                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  );
                },
              );
            }else{
              final data = response.data;
              return  ListView.builder(
                itemCount: data!.length, // Example itemCount
                shrinkWrap: true,

                itemBuilder: (context, index) {

                  return GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      child: Card(
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 120.0,
                                width: 70.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey.shade100,width: 1.0)
                                ),
                                child: Icon(Icons.sunny_snowing,color: Colors.yellow,size: 50.0),
                              ),
                              SizedBox(width: 20.0),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[index].courseName,
                                      style: TextStyle(fontWeight: FontWeight.w900),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    Text(data[index].courseDurauion),
                                    RatingBar.builder(
                                      initialRating: data[index].courseRating == null ? 1.0 : data[index].courseRating,
                                      minRating: 1,
                                      itemSize: 12,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    SizedBox(height: 5.0,),
                                    GestureDetector(
                                      onTap: (){
                                        FileDownloader.downloadFile(
                                            url: 'https://sailorfy.searchosis.com'+data[index].certificatePdf,
                                            name: data[index].name+DateTime.now().toLocal().toString(),//(optional)
                                            onProgress: (fileName, progress) {
                                              isDownloading = true;
                                              setState(() {

                                              });
                                              print('FILE fileName HAS PROGRESS $progress');
                                            },
                                            onDownloadCompleted: (String path) {
                                              print('FILE DOWNLOADED TO PATH: $path');
                                              isDownloading = false;
                                              setState(() {

                                              });
                                            },
                                            onDownloadError: (String error) {
                                              print('DOWNLOAD ERROR: $error');
                                            },
                                          downloadDestination: DownloadDestinations.publicDownloads,
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.download_rounded,color: Colors.blue),
                                          Text('Download Certificate',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                  );
                },
              );
            }

          }
      ),
      bottomNavigationBar: AbsorbPointer(
        absorbing: true,
          child: BottomBar(dashBoardController: dashBoardController)),




    );
  }
}
