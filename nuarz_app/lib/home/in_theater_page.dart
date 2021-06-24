import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuarz_app/component/outlined_filter_chip.dart';
import 'package:nuarz_app/home/ui_models.dart';
import 'package:nuarz_app/moviedetail/movie_detail_page.dart';
import 'package:nuarz_app/util/app_color.dart';
import 'package:nuarz_app/util/app_svg_icons.dart';

class InTheaterPage extends StatefulWidget {
  @override
  State createState() => InTheaterPageState();
}

class InTheaterPageState extends State<InTheaterPage>
    with AutomaticKeepAliveClientMixin<InTheaterPage> {
  late List<MovieGenreUiModel> _genres;
  late List<MovieItemUiModel> _movies;

  List<int> _selectedGenres = List.empty(growable: true);
  final PageController _controller = PageController(viewportFraction: 0.7);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _genres = [
      MovieGenreUiModel("Action", 1),
      MovieGenreUiModel("Crime", 2),
      MovieGenreUiModel("Comedy", 3),
      MovieGenreUiModel("Drama", 4),
    ];
    _movies = [
      MovieItemUiModel(
        1,
        "Spider Man : Far from home",
        8.2,
        "https://sm.ign.com/t/ign_in/gallery/s/spider-man/spider-man-far-from-home-official-movie-posters_epch.480.jpg",
      ),
      MovieItemUiModel(
        2,
        "Joker",
        8.0,
        "https://creativereview.imgix.net/content/uploads/2019/12/joker_full.jpg?auto=compress,format&q=60&w=480",
      ),
      MovieItemUiModel(
        3,
        "Ford v Ferrari",
        8.2,
        "https://www.digitalartsonline.co.uk/cmsdata/slideshow/3662115/star-wars-last-jedi-poster.jpg",
      ),
    ];
  }

  @override
  bool get wantKeepAlive {
    return true;
  }

  void _onTapMoviePage(MovieItemUiModel movie) {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, animation, otherAnimation) =>
            MovieDetailPage(id: movie.id, image: movie.image),
        transitionsBuilder: (context, animation, otherAnimation, child) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutQuint,
          );
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          _buildSizedBox(height: 24.0),
          _buildChips(),
          _buildSizedBox(height: 40.0),
          _buildPageView(),
        ],
      ),
    );
  }

  Widget _buildSizedBox({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

  Widget _buildPageView() {
    return SizedBox(
      height: 520,
      child: PageView.builder(
        controller: _controller,
        itemCount: _movies.length,
        physics: BouncingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final active = index == _currentPage;
          final prev = index == _currentPage - 1;
          final next = index == _currentPage + 1;
          return _buildMoviePage(active, prev, next, _movies[index]);
        },
      ),
    );
  }

  Widget _buildChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 32.0, right: 32.0),
      child: Wrap(
        spacing: 20.0,
        children: List<Widget>.generate(_genres.length, (index) {
          final genre = _genres[index];
          final exist = _selectedGenres.contains(genre.id);
          return OutlinedFilterChip(
            label: genre.name,
            selected: exist,
            onSelected: (selected) {
              setState(() {
                if (!selected && exist) _selectedGenres.remove(genre.id);
                if (selected && !exist) _selectedGenres.add(genre.id);
              });
            },
          );
        }),
      ),
    );
  }

  Widget _buildMoviePage(
    bool active,
    bool prev,
    bool next,
    MovieItemUiModel movie,
  ) {
    final double imageOpacity = active ? 1 : 0.4;
    final double titleOpacity = active ? 1 : 0.0;
    final double blur = active ? 4.0 : 0;
    final double shadowDx = active ? 0 : 0;
    final double shadowDy = active ? 4.0 : 0;
    final double top = active ? 0.0 : 16.0;
    final double bottom = active ? 16.0 : 0.0;
    double rotation = 0;
    final AlignmentGeometry alignment = Alignment.bottomCenter;
    if (prev) {
      rotation = -6.45;
    } else if (next) {
      rotation = 6.45;
    }

    return GestureDetector(
      onTap: () {
        _onTapMoviePage(movie);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: bottom,
                top: top,
              ),
              transformAlignment: alignment,
              transform: Matrix4.rotationZ(rotation),
              child: Opacity(
                opacity: imageOpacity,
                child: AspectRatio(
                  aspectRatio: 0.67,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(movie.image),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.movieShadowColor,
                          blurRadius: blur,
                          offset: Offset(shadowDx, shadowDy),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          _buildSizedBox(height: 24),
          Opacity(
            opacity: titleOpacity,
            child: Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          _buildSizedBox(height: 8.0),
          Opacity(
            opacity: titleOpacity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppSvgIcons.icon_star_filled,
                  color: AppColors.orange,
                  width: 18.0,
                  height: 18.0,
                ),
                _buildSizedBox(width: 8.0),
                Text(
                  "${movie.rating}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: AppColors.chipTextColor,
                  ),
                ),
              ],
            ),
          ),
          _buildSizedBox(height: 16.0)
        ],
      ),
    );
  }
}
