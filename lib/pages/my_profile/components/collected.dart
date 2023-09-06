import 'package:flutter/material.dart';
import '../../../models/nft.dart';
import '../../../pages/my_profile/components/collections_section.dart';
import '../../../pages/my_profile/components/singles_section.dart';

import '../../../models/profile.dart';

class Collected extends StatelessWidget {
  final String scrollkey1;
  final String scrollkey2;
  final List<NFT> nftList;

  List<Profile> listProfile = Profile.generateListProfile();

  Collected(this.scrollkey1, this.scrollkey2, this.nftList, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CollectionsSection(scrollkey1, listProfile),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              key: PageStorageKey(scrollkey2),
              padding: const EdgeInsets.all(20),
              itemBuilder: (_, index) => SinglesSection(nftList[index]),
              separatorBuilder: (_, index) => const SizedBox(
                    height: 15,
                  ),
              itemCount: nftList.length),
        ],
      ),
    );
  }
}
