import 'package:flutter/material.dart';

import '../../../models/profile.dart';

class CollectionsSection extends StatelessWidget {
  final String scrollkey;
  Profile profile = Profile.generateProfile();
  List<Profile> listProfile;

  CollectionsSection(
    this.scrollkey,
    this.listProfile, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        key: PageStorageKey(scrollkey),
        padding: const EdgeInsets.all(20),
        itemBuilder: (_, index) => _buildIconText(
            listProfile[index].imgUrl!,
            listProfile[index].name!,
            listProfile[index].twitter!.substring(1),
            0),
        separatorBuilder: (_, index) => const SizedBox(
              height: 15,
            ),
        itemCount: listProfile.length);
  }
}

/////
_buildIconText(String imgUrl, String title, String text, double padding) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(padding),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, height: 1.5),
                ),
                Row(
                  children: [
                    Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    const Icon(
                      Icons.check_circle,
                      size: 12,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        Container(
            padding: EdgeInsets.all(padding),
            height: 60,
            child: const Icon(
              Icons.favorite_border,
              color: Colors.grey,
            )),
        const SizedBox(
          height: 20,
        ),
      ]);
}
