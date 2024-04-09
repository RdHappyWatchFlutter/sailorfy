import 'package:flutter/cupertino.dart';

class ActiveTrainings extends StatefulWidget {
  const ActiveTrainings({super.key});

  @override
  State<ActiveTrainings> createState() => _ActiveTrainingsState();
}

class _ActiveTrainingsState extends State<ActiveTrainings> {
  final
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TrainingList>>(
        future: dashBoardController.getActiveTrainingList(),
        builder: (context,
            AsyncSnapshot<List<TrainingList>> response) {
          if (!response.hasData || response.hasError) {
            return Container();
          } else {
            final data = response.data![0];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Active Training',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 120.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.grey.shade50)),
                              child: const Icon(Icons.sunny_snowing,
                                  color: Colors.yellow, size: 50.0),
                            ),
                            const SizedBox(width: 20.0),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  data.instituteName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5),
                                  child: Text(
                                      dashBoardController.getDuration(
                                          data.endDate,
                                          data.startDate)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: RatingBar.builder(
                                    initialRating:
                                    data.courseRating == ''
                                        ? 1.0
                                        : double.parse(
                                        data.courseRating),
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
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ),
              ],
            );
          }
        });
  }
}
