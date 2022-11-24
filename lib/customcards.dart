import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'model/newsapi.dart';
import 'newsdetail.dart';


class VerticalListCard extends StatelessWidget{
  Articles articles;
  VerticalListCard(this.articles);


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
    var size= MediaQuery.of(context).size;
   return GestureDetector(
     onTap: (){
      Navigator.push(context, MaterialPageRoute(
          builder:(context)=> NewsDetail(articles: articles,)));
     },
     child: Card(
       elevation: 1,
       child: Container(
         child: Row(
           children: [
             Column(
               children: [
                 Stack(
                   children: [
                     CachedNetworkImage(
                       imageUrl: articles.urlToImage!,
                       fit: BoxFit.cover,
                       width: 130,
                       height: 100,
                       errorWidget: (context,url, error)=>
                       const Icon(Icons.do_not_disturb_alt,
                         color: Colors.white,),
                       placeholder: (context,url)=>
                       const CircularProgressIndicator(),

                     ),
                     const Positioned(
                       top: 40,
                       left: 40,
                       child: Icon(Icons.play_circle,
                         color: Colors.white,size:30 ,),
                     )
                   ],
                 ),
               ],
             ),
             Container(
               padding: const EdgeInsets.all(8.0),
               width: size.width/1.7,
               child: Column(
                 children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(articles.title!,style:
                   const TextStyle(color: Colors.black,
                         fontSize: 14,fontWeight: FontWeight.bold),),
                    )
                   ,
                   Row(
                     children: [
                       //button
                       Container(
                        margin: const EdgeInsets.only(left: 10),
                         height: 40,width: 100,
                         decoration: BoxDecoration(
                           color: Colors.red,
                           borderRadius: BorderRadius.circular(25),
                         ),
                         child:   Padding(
                           padding: EdgeInsets.all(8.0),
                           child: Center(
                             child: Text(urlformatter(articles.url!),style:
                             const TextStyle(color: Colors.white,
                                 fontSize: 10,fontWeight: FontWeight.bold),),
                           ),
                         )
                         ,

                       ),
                       //date
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: 80,
                          child: Text(dateformatter(articles.publishedAt!),style:
                       const TextStyle(color: Colors.black,
                             fontSize: 12,fontWeight: FontWeight.bold),),
                        )
                       ,
                     ],
                   )

                 ],

               ),
             )

           ],
         ),

       ),
     ),
   );
  }

}

