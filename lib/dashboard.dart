import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/api/get.dart';
import 'customcards.dart';
import 'model/newsapi.dart';
enum Gender{
male, female, other
}
class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}
class DashboardState extends State<Dashboard>{
  late Future<newsapi?> futurenews;
  int male = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(male==0){
      //condition0
    }
    futurenews = GetApi.getnewsdata(context) as Future<newsapi?>;
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            //if
             male==0?const Text("His Dashboard",
            style: TextStyle(color: Colors.white,fontSize: 16,
                fontWeight: FontWeight.bold),):
             //else
             const Text("Her Dashboard",
              style: TextStyle(color: Colors.white,fontSize: 16,
                  fontWeight: FontWeight.bold),),
          ],
        ),
        elevation: 1,
        actions: const [
          Padding(
            padding: EdgeInsets.all(15),
            child: Icon(Icons.manage_search_rounded,
              color: Colors.white,size: 30,),
          )
        ],
      ),
      body: Container(
        width: size.width,
    //    height: size.height/1.5,
        child: Column(
          children: [
            FutureBuilder(future: futurenews,
                builder: (BuildContext context, AsyncSnapshot snapshot)
                  {
                    switch (snapshot.connectionState){
                      case ConnectionState.none:
                        return Container(
                          child: const Text("Try Loading Again"),
                        );
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Container(
                          child: const CircularProgressIndicator(),
                        );
                      case ConnectionState.done:
                        if(!snapshot.hasData){
                          //no data
                          return Container(
                            child: const Text("No news data available"),
                          );
                        }else{
                          //has data
                          return Column(
                            children: [
                              //horizontal listview
                              male==0?Container(
                                height: size.height/5,
                                child: ListView.builder(
                                  primary: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: snapshot.data.articles.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int index)
                                  =>Card(
                                    elevation: 1,
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: snapshot.data.articles[index].urlToImage,
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
                                          Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: Column(
                                              children:  [
                                                Text(snapshot.data.articles[index].title,
                                                  style:const TextStyle(color: Colors.white,
                                                      fontSize: 16) ,),
                                                Text(snapshot.data.articles[index].publishedAt,
                                                  style:const TextStyle(color: Colors.white,
                                                      fontSize: 16) ,),
                                              ],
                                            ),
                                          ),
                                          const Positioned(
                                            bottom: 10,
                                            right: 10,
                                            child: Icon(Icons.play_circle,
                                              color: Colors.white,size: 30,),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ):Container(),

                              //vertical listview
                              Container(
                                height: size.height/1.5,
                                child: ListView.builder(
                                  primary: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: snapshot.data.articles.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext context, int index)
                                  =>VerticalListCard(snapshot.data.articles[index]),
                                ),
                              )
                            ],
                          );

                        }
                    }
                    // return const Text("Try Loading again");

                  }),
          ],
        ),

      ),
    );
  }
}
