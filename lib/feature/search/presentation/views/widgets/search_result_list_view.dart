import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/utils/app_style.dart';
import 'package:moviesapp/core/widgets/louding_indicator.dart';
import 'package:moviesapp/core/widgets/movies_failure_wigets.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/similar.dart';
import 'package:moviesapp/feature/search/presentation/manage/search_cubit/search_cubit.dart';
import 'package:moviesapp/feature/search/presentation/views/widgets/search_item.dart';

import '../../../../../constants.dart';

class SearchResultGridView extends StatelessWidget {
  const SearchResultGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final crossAxisCount = screenWidth > 600 ? 4 : 3;
    final aspectRatio = screenWidth > 600 ? 3 / 5 : 3 / 6;

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.searchModel.isEmpty) {
            return Center(
              child: Text(
                'No results found.',
                style: AppStyle.styleSemiBold24(context),
              ),
            );
          }
          return GridView.builder(
            itemCount: state.searchModel.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: aspectRatio,
            ),
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              return SearchItem(
                searchModel: state.searchModel[index],
              );
            },
          );
        } else if (state is SearchFailure) {
          log(state.errMessage);
          return MoviesFailureWigets(errMessage: state.errMessage);
        } else if (state is SearchInitial) {
          return Center(
              child: Text(
            'Please inter name movie',
            style: AppStyle.styleSemiBold24(context),
          ));
        } else {
          return const LoudingIndicatorWidget();
        }
      },
    );
  }
}


// class SearchResultListView extends StatelessWidget {
//   const SearchResultListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SearchCubit, SearchState>(
//       builder: (context, state) {
//         if (state is SearchSuccess) {
//           return ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               padding: EdgeInsets.zero,
//               itemCount: state.bookModel.length,
//               itemBuilder: (context, index) {
//                 return BookListViewItem(
//                   bookModel: state.bookModel[index],
//                 );
//               });
//         } else if (state is SearchFailure) {
//           return CustomErrorMessage(errMessage: state.errMessage);
//         } else if (state is SearchLouding) {
//           return const CustomCircleIndicator();
//         } else {
//           return const Center(
//             child: Text('inter book name in  menu search '),
//           );
//         }
//       },
//     );
//   }
// }
