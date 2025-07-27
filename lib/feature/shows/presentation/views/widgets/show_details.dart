import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moviesapp/feature/shows/data/models/show_details_model.dart';

import '../../../../../core/utils/app_style.dart';

class ShowsDetails extends StatelessWidget {
  const ShowsDetails({
    super.key,
    required this.showDetailModel,
  });
  final ShowDetailModel showDetailModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Column(
        children: [
          Text(
            showDetailModel.name ?? '',
            style: AppStyle.styleSemiBold24(context),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'SIE9',
                        style: AppStyle.styleSemiBold18(context),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Drama',
                        style: AppStyle.styleSemiBold18(context),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Season',
                        style: AppStyle.styleSemiBold18(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        showDetailModel.voteAverage.toString(),
                        style: AppStyle.styleSemiBold20(context),
                      ),
                      Text('(${showDetailModel.voteCount})',
                          style: AppStyle.styleSemiBold18(context)),
                    ],
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // final Uri _url = Uri.parse('https://flutter.dev');
                  // Future<void> _launchUrl() async {
                  //   if (!await launchUrl(_url)) {
                  //     throw Exception('Could not launch $_url');
                  //   }
                  // }
                },
                child: Container(
                  width: 50, // Set desired size
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.red, // Red background
                    shape: BoxShape.circle, // Circular shape
                  ),
                  child: const Icon(
                    Icons.play_arrow, // Play icon
                    color: Colors.white, // White color for the icon
                    size: 35, // Icon size
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
