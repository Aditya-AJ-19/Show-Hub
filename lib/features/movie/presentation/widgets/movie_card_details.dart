import 'package:flutter/material.dart';
import 'package:show_hub/core/domain/entity/media_details.dart';
import 'package:show_hub/core/presentation/components/circle_dot.dart';

class MovieCardDetails extends StatelessWidget {
  final MediaDetails movieDetails;
  const MovieCardDetails({super.key, required this.movieDetails,});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (movieDetails.releaseDate.isNotEmpty &&
        movieDetails.genres.isNotEmpty &&
        movieDetails.runtime!.isNotEmpty) {
      return Row(
        children: [
          if (movieDetails.releaseDate.isNotEmpty) ...[
            Text(
              movieDetails.releaseDate.split(',')[1],
              style: textTheme.bodyLarge,
            ),
            const CircleDot(),
          ],
          if (movieDetails.genres.isNotEmpty) ...[
            Text(
              movieDetails.genres,
              style: textTheme.bodyLarge,
            ),
            const CircleDot(),
          ] else ...[
            if (movieDetails.runtime!.isNotEmpty) ...[
              const CircleDot(),
            ]
          ],
          Text(
            movieDetails.runtime!,
            style: textTheme.bodyLarge,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}