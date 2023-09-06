import 'package:flutter/material.dart';

import '../../../models/nft.dart';

class SinglesSection extends StatelessWidget {
  final NFT nft;

  SinglesSection(
    this.nft, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        //extendBodyBehindAppBar: true,

        padding: const EdgeInsets.all(5),
        child: _buildIconText(nft.imgUrl!, nft.name!, nft.desc!, 5),
      ),
    );
  }
}

/////
_buildIconText(String imgUrl, String title, String text, double padding) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(padding),
        height: 350,
        width: 350,
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
        width: 10,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            ),
            Container(
                padding: EdgeInsets.all(padding),
                height: 60,
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    ],
  );
}
