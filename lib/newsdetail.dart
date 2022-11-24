import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import 'model/newsapi.dart';


class NewsDetail extends StatefulWidget{
  const NewsDetail({Key? key, this.articles}) : super(key: key);
  final Articles? articles;
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return NewsDetailState(articles);
  }

}
class NewsDetailState extends State<NewsDetail>{
   final Articles? articles;

  NewsDetailState(this.articles);
  String dateformatter(String date){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime format = dateFormat.parse(date);
    DateFormat temp = DateFormat("MMM dd, yyyy");
    String d = temp.format(format);
    return d;
  }
  String urlformatter(String url)
  {
    String temp = url.split("://")[1];
    String temp1 = temp.split(".")[0];
    return temp1;

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
           children: [
             Stack(
               children: [
                 CachedNetworkImage(
                   imageUrl: articles!.urlToImage!,
                   fit: BoxFit.cover,
                   width: size.width/1.6,
                   height: size.height/5,
                   errorWidget: (context,url, error)=>
                   const Icon(Icons.do_not_disturb_alt,
                     color: Colors.white,),
                   placeholder: (context,url)=>
                       Container(height: 30,width: 30
                           ,child: const
                           CircularProgressIndicator(strokeWidth: 0.5,)),
                 ),
                 const Positioned(
                   bottom: 10,
                   right: 10,
                   child: Icon(Icons.play_circle,
                     color: Colors.white,size: 30,),
                 )
               ],
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(articles!.title!,style:
               const TextStyle(color: Colors.black,
                   fontSize: 16,fontWeight: FontWeight.bold),),
             ),
             Row(
               children: [
                 //button
                 Container(
                   margin: const EdgeInsets.only(left: 10),
                   height: 40,width: 100,
                   child:   Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Center(
                       child: Text(urlformatter(articles!.url!),style:
                       const TextStyle(color: Colors.white,
                           fontSize: 10,fontWeight: FontWeight.bold),),
                     ),
                   )
                   ,

                 ),
                 //dte
                 Container(
                   padding: const EdgeInsets.only(left: 10),
                   width: 80,
                   child: Text(dateformatter(articles!.publishedAt!),style:
                   const TextStyle(color: Colors.black,
                       fontSize: 12,fontWeight: FontWeight.bold),),
                 )
                 ,
               ],
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(articles!.description!,style:
               const TextStyle(color: Colors.black,
                   fontSize: 16,fontWeight: FontWeight.normal),),
             ),
           ],

        ),
      ),
    );
  }

}