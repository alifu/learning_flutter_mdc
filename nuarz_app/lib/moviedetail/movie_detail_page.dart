import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuarz_app/component/outlined_filter_chip.dart';
import 'package:nuarz_app/component/section_layout.dart';
import 'package:nuarz_app/moviedetail/ui_models.dart';
import 'package:nuarz_app/util/app_color.dart';
import 'package:nuarz_app/util/app_svg_icons.dart';

class MovieDetailPage extends StatefulWidget {
  MovieDetailPage({
    Key? key,
    required this.id,
    required this.image,
  }) : super(key: key);

  final int id;
  final String image;

  @override
  State createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetailPage> {
  final List<String> _genres = [
    "Action",
    "Biography",
    "Comedy",
  ];

  final List<CrewUiModel> _crews = [
    CrewUiModel(
        "Alifu Alifu Alif",
        "https://sm.ign.com/t/ign_in/gallery/s/spider-man/spider-man-far-from-home-official-movie-posters_epch.480.jpg",
        "Director"),
    CrewUiModel(
        "Sainal Abidin",
        "https://sm.ign.com/t/ign_in/gallery/s/spider-man/spider-man-far-from-home-official-movie-posters_epch.480.jpg",
        "Director"),
    CrewUiModel(
        "Amar Siapa Saya",
        "https://sm.ign.com/t/ign_in/gallery/s/spider-man/spider-man-far-from-home-official-movie-posters_epch.480.jpg",
        "Developer"),
    CrewUiModel(
        "Muhammad Muaz",
        "https://sm.ign.com/t/ign_in/gallery/s/spider-man/spider-man-far-from-home-official-movie-posters_epch.480.jpg",
        "Manager"),
    CrewUiModel(
        "Tenroaji Fira",
        "https://sm.ign.com/t/ign_in/gallery/s/spider-man/spider-man-far-from-home-official-movie-posters_epch.480.jpg",
        "Manager"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset(
            AppSvgIcons.icon_chevron_left,
            color: AppColors.iconPrimary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            _buildSummarySection(),
            _buildChipGenres(),
            SectionLayout(
              title: "Plot Summary",
              content: Text(
                "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.textDescription,
                  fontWeight: FontWeight.w400,
                  height: 1.7,
                ),
              ),
            ),
            SectionLayout(
              title: "Cast & Crew",
              content: Wrap(
                spacing: 28.0,
                runSpacing: 8.0,
                children: List.generate(
                  _crews.length,
                  (index) {
                    final crew = _crews[index];
                    return _buildCrew(
                      name: crew.name,
                      image: crew.image,
                      role: crew.role,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    final heightOverflowInfo = 109.0;
    final halfHeightOverflowInfo = heightOverflowInfo / 2.0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Opacity(
          opacity: 0.85,
          child: AspectRatio(
            aspectRatio: 1.3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -halfHeightOverflowInfo,
          left: 32.0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(halfHeightOverflowInfo),
                  topLeft: Radius.circular(halfHeightOverflowInfo),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 5.0),
                    blurRadius: 50.0,
                    color: AppColors.detailShadowColor,
                  )
                ]),
            child: SizedBox(
              height: heightOverflowInfo,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 4.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppSvgIcons.icon_star_filled,
                        color: AppColors.orange,
                        width: 26.0,
                        height: 26.0,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "8.2",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                  text: "/10",
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ))
                            ]),
                      ),
                      Text(
                        "150,212",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Rate This"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppSvgIcons.icon_star_outline,
                          color: AppColors.iconPrimary,
                          width: 26.0,
                          height: 26.0,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "Rate This",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 26.0,
                        height: 26.0,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "86",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "Metascore",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "62 critic reviews",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummarySection() {
    return Container(
      margin: EdgeInsets.only(
        top: 94.0,
        left: 32.0,
        right: 32.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSummaryInfo(),
          _buildAddAction(),
        ],
      ),
    );
  }

  Widget _buildSummaryInfo() {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Title",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 32.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 8.0,
            ),
            child: Wrap(
              spacing: 24.0,
              children: [
                Text(
                  "2021",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  "PG-13",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  "2h 32min",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddAction() {
    return Material(
      color: AppColors.tabIndicator,
      borderRadius: BorderRadius.circular(20.0),
      clipBehavior: Clip.hardEdge,
      elevation: 0.0,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 28.0,
          ),
        ),
      ),
    );
  }

  Widget _buildChipGenres() {
    return Padding(
      padding: EdgeInsets.only(left: 32.0, top: 16.0, right: 32.0),
      child: Wrap(
        spacing: 12.0,
        runAlignment: WrapAlignment.start,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List.generate(
            _genres.length,
            (index) => OutlinedFilterChip(
                  label: _genres[index],
                  onSelected: (selected) {},
                  padding: EdgeInsets.only(
                    left: 8.0,
                    top: 6.0,
                    bottom: 6.0,
                    right: 8.0,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.chipTextColor,
                  ),
                  disabledColor: Colors.white,
                )),
      ),
    );
  }

  Widget _buildCrew({
    required String image,
    required String name,
    required String role,
  }) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            height: 80,
            padding: EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0, bottom: 16.0),
            child: Text(
              role,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
