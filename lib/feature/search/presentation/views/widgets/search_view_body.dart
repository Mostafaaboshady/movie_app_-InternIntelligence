import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/utils/app_style.dart';
import 'package:moviesapp/feature/search/presentation/manage/search_cubit/search_cubit.dart';
import 'package:moviesapp/feature/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:moviesapp/feature/search/presentation/views/widgets/search_result_list_view.dart';

import '../../../../movies/presentation/views/widgets/buttom_navigation_bar.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    const BottomNavigationBarWidget();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: CustomSearchTextField(
              onChanged: (data) {
                BlocProvider.of<SearchCubit>(context)
                    .getSearchMovie(title: data);
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 20),
            child: Text(
              'Result Search',
              style: AppStyle.styleSemiBold20(context),
            ),
          ),
          const SizedBox(height: 10),
          const Expanded(
            child: SearchResultGridView(),
          ),
          const BottomNavigationBarWidget()
        ],
      ),
    );
  }
}
