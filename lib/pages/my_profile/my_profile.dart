import 'package:flutter/material.dart';
import 'package:nft_marketplace_suite/pages/my_profile/components/collected.dart';
import '../../models/profile.dart';
import 'components/details_banner.dart';
import 'components/tabSliverCustom.dart';

class MyProfile extends StatelessWidget {
  //final => static const
  static const tabs =["Collected", "Created"];
   Profile profile = Profile.generateProfile();
   

   MyProfile( {Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(

          headerSliverBuilder: 
                (context, innerBoxIsScrolled) => <Widget>[
                  
                   SliverToBoxAdapter(
                    child: DetailsBanner(),
                  ),

                  SliverPersistentHeader(
                    delegate: TabSliverCustom(
                       TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey[400],
                        indicatorColor:Colors.black,
                        tabs: 
                          tabs.map((e) => Tab(
                            child: Text(e,
                            style: const TextStyle(fontSize: 18),),
                          )).toList()
                        )
                  ),
                  pinned: true,
                  )

                ],
                
           body:   TabBarView(children: [
             Collected("creations","name", profile.collections!),
             Text("data"),

           ]),
           )
        ),
    );
  }
}