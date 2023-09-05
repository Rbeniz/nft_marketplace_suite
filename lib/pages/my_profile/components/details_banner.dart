import 'package:flutter/material.dart';

import '../../../models/profile.dart';




class DetailsBanner extends StatelessWidget {

  
   Profile profile = Profile.generateProfile();

  DetailsBanner({Key? key,}) : super(key: key);
 



  @override
  Widget build(BuildContext context) {
    return Container(
      //extendBodyBehindAppBar: true,
    
    padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            
             _buildIconText(profile.imgUrl!, profile.name!, profile.twitter!.substring(1),0),
                  
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.switch_access_shortcut_add_rounded)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.settings_input_svideo_rounded)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.insert_link_rounded)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.notes_rounded)),

              ],
            )
            
          ],
        ),
      
    );
  }
}



/////
_buildIconText(String imgUrl, String title, String text , double padding ){
    return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                      padding: EdgeInsets.all(padding),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.network(
                            imgUrl,
                            fit: BoxFit.cover,),
                      ),
                    ),


                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                       Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style:
                             const TextStyle(color: Colors.black45,),
                      ),
                      Text(
                        text,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight:FontWeight.bold,
                            height: 1.5),
                      ),
                    ],
                  ),
                  
                ],
              );
}

