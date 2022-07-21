import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task_product/model/item.dart';
import 'package:task_product/shared/appbar.dart';
import 'package:task_product/shared/colors.dart';

class Details extends StatefulWidget {
  static const String routeName ="details";

 Item product ;
 Details({required this.product});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
 bool isShowMore = true;
 double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarProduct()
        ],
        backgroundColor: appbarGreen,
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.product.imgPath),
            SizedBox(height: 11,),
            Text("${widget.product.price}",
            style: TextStyle(
              fontSize: 20
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  child: Text("New",
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 129, 129),
                    borderRadius: BorderRadius.circular(4)
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Row(
                  children: [
                  RatingBar.builder(
                  initialRating: rating,
                 itemSize: 30,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  updateOnDrag: true,
                    itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {

                    });
                    this.rating = rating;
                    print(rating);
                  },
                ),
                    // Icon(Icons.star,
                    // size: 26,
                    //   color: Color.fromARGB(255, 255, 191, 0),
                    // ),
                    // Icon(Icons.star,
                    //   size: 26,
                    //   color: Color.fromARGB(255, 255, 191, 0),
                    // ),
                    // Icon(Icons.star,
                    //   size: 26,
                    //   color: Color.fromARGB(255, 255, 191, 0),
                    // ),
                    // Icon(Icons.star,
                    //   size: 26,
                    //   color: Color.fromARGB(255, 255, 191, 0),
                    // ),
                    // Icon(Icons.star,
                    //   size: 26,
                    //   color: Color.fromARGB(255, 255, 191, 0),
                    // ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                // Row(
                //   children: [
                //     Icon(Icons.edit_location,
                //     size: 26,
                //       color: Color.fromARGB(168, 3, 65, 27),
                //     ),
                //     SizedBox(
                //       width: 3,
                //     ),
                //     Text(
                //       "Flower sheep",
                //       style: TextStyle(
                //           fontSize: 19
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              child: Text("Details :",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18
              ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering (plants plants of the division Angiospermae Flower Images. Flowers are among the most beautiful things you can find in this world. Give a nice touch to all your projects by downloading these free and..",
               maxLines: isShowMore? 3 : null,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey
                ),
              ),
            ),
            TextButton(
                onPressed: (){
                  setState(() {
                    isShowMore = !isShowMore;
                  });
                }, child: Text(isShowMore ? "Show More" : "Show Less",
            style: TextStyle(
              fontSize: 18
            ),
            )
            )
          ],
        ),
      ),
    );
  }
}