import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/presentation/components/custom_appbar.dart';
import 'package:show_hub/core/presentation/components/loading_indicater.dart';
import 'package:show_hub/core/presentation/components/vertical_listview_card.dart';
import 'package:show_hub/core/resources/app_strings.dart';
import 'package:show_hub/features/watch%20List/presentation/bloc/watchlist_bloc.dart';
import 'package:show_hub/features/watch%20List/presentation/widgets/empty_watchlist_text.dart';
import 'package:show_hub/injection_container.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<WatchlistBloc>()..add(GetWatchListItemsEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.watchlist,
        ),
        body: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            if (state.status == WatchlistRequestStatus.loading) {
              return const LoadingIndicator();
            } else if (state.status == WatchlistRequestStatus.loaded) {
              return WatchlistWidget(items: state.items);
            } else if (state.status == WatchlistRequestStatus.empty) {
              return const EmptyWatchlistText();
            } else {
              return Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }
}


class WatchlistWidget extends StatelessWidget {
  const WatchlistWidget({
    super.key,
    required this.items,
  });

  final List<Media> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),
      itemBuilder: (context, index) {
        return VerticalListViewCard(media: items[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
    );
  }
}
