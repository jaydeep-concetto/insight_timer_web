import 'package:flutter_web/material.dart';
import 'package:insight_timer_web/utilities/scroll_listener.dart';
import 'package:insight_timer_web/widgets/navigator_theme.dart';
import 'package:insight_timer_web/resource/insight_timer_icons_icons.dart';

class SleepPage extends StatefulWidget {
  final bool isFromInnerPage;
  SleepPage({this.isFromInnerPage = false});
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage>with ScrollListener {
  double _opacityLevel = 0.0;
  bool _isScrollMethodCall = true;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191C2F),
      body:  Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          new Positioned(
            left: 0,
            top: 0,
            child: Container(
              height: 406,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff000000), const Color(0xff191C2F)],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                _buildHeaderView(),
                _buildSectionTitle("FEATURED"),
                SizedBox(height: 18),
                 _FeatureList(),
                SizedBox(height: 50),
                _buildSleepPlustHeaderView(),
                SizedBox(height: 18),
                _SleepPlusList(),
                SizedBox(height: 24),
                _buildSevenDayFreeTrialWidget(),
                SizedBox(height: 50),
                _setupListItem(),
                SizedBox(height: 44),
                _buildSectionTitle("POPULAR"),
                SizedBox(height: 18),
                
                SizedBox(height: 40),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
  Widget _buildHeaderView() {
    return Container(
      height: 220,
      child: Stack(
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 85),
            child: Column(
              children: <Widget>[
                Text(
                  'sleep',
                  style: TextStyle(
                      fontSize: 44,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "sleeper"),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Hundreds of free sleep tracks\nso you can sleep freely',
                  style: TextStyle(
                      fontSize: 14,
                      height: 1.1,
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.normal,
                      fontFamily: ".SF UI Display"),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
 Container _setupListItem() {
    return Container(
      child: Column(children: <Widget>[
        _builListItem("New & Trending"),
        _builListItem("Sleep Music",
            navigationTitleAvailable: true,),
        _builListItem("Soundscapes",
            navigationTitleAvailable: true,),
        _builListItem("Bedtime Tales",
            navigationTitleAvailable: true,),
        _builListItem("Sleep Meditations",
            navigationTitleAvailable: true,),
        _builListItem("Sleep for Kids",
            navigationTitleAvailable: true,),
      ]),
    );
  }
  _builListItem(String title,
      {bool navigationTitleAvailable = false}) {
    return GestureDetector(
      onTap: () {
        if (!widget.isFromInnerPage) {
          NavigatorTheme.of(context).changeToLightTheme();
        }
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (BuildContext context) {
        //     return FilteredLibraryItemsPage(
        //       libraryFilter: filter,
        //       fromScreenName: 'Sleep',
        //       title: navigationTitleAvailable ? title : 'Sleep',
        //       brightness: Brightness.light,
        //       isFromInnerPage: widget.isFromInnerPage,
        //     );
        //   }),
        // );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 27, vertical: 12),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
            ),
            Expanded(child: Container()),
            SizedBox(width: 8),
            Icon(
              InsightTimerIcons.arrow_right_thin,
              color: Colors.white.withOpacity(0.4),
              size: 16,
            )
          ],
        ),
      ),
    );
  }
  _moveToBack() {
    if (!widget.isFromInnerPage) {
      NavigatorTheme.of(context).isNewHome = true;
      NavigatorTheme.of(context).changeToLightTheme();
    }
    Navigator.of(context).pop();
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.only(left: 28, right: 32),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSleepPlustHeaderView() {
    return Container(
      margin: EdgeInsets.only(left: 28, right: 32),
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(InsightTimerIcons.bird, color: Color(0xff1982D0), size: 20),
              SizedBox(width: 8),
              Text(
                "SLEEP PLUS",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8, left: 2),
            child: Text(
              "Long form sleep tracks and Courses\nfor a deeper slumber",
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
          )
        ],
      ),
    );
  }


  _buildSevenDayFreeTrialWidget() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      height: 50,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const Color(0xff11A1A7), const Color(0xff1982D0)],
          ),
          borderRadius: new BorderRadius.circular(10.0)),
      child: Stack(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Member Plus - 7 Day Free Trial",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          new Positioned(
            left: 18,
            top: 0,
            bottom: 0,
            child: Icon(InsightTimerIcons.bird, color: Colors.white, size: 16),
          ),
        ],
      ),
    );
  }


  Widget _buildBackButton() {
    return Positioned(
      top: 6,
      left: 24,
      child: SafeArea(
        child: InkWell(
          child: Container(
            width: 20,
            height: 20,
            child: Icon(InsightTimerIcons.arrow_left,
                color: _opacityLevel == 0.0
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                size: 16),
          ),
          onTap: () => {
                _moveToBack(),
              },
        ),
      ),
    );
  }

}
class _FeatureList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Text(
            'Error',
            style: TextStyle(color: Colors.red, fontSize: 20),
          );
        }
}
class _SleepPlusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 150.0 / 375.0;
    final height = width * 180.0 / 150.0;
    return Text(
            'Error',
            style: TextStyle(color: Colors.red, fontSize: 20),
          );
        }
}
// class _PopularList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> gridViewItems;
//     return StreamBuilder(
//       stream: ItemRepository.instance.getPopularSleepItems(),
//       builder: (context, AsyncSnapshot<List<Item>> itemsSnapshot) {
//         if (itemsSnapshot.hasError) {
//           return Text(
//             'Error: ${itemsSnapshot.error}',
//             style: TextStyle(color: Colors.red, fontSize: 20),
//           );
//         }

//         if (!itemsSnapshot.hasData) {
//           gridViewItems = [0, 1, 2, 3, 4, 5, 6]
//               .map((_) => ItemCardLoadingWidget())
//               .toList();
//         } else {
//           gridViewItems =
//               itemsSnapshot.data.map((item) => ItemCardWidget(item)).toList();
//         }

//         return GridView.count(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           crossAxisCount: 2,
//           mainAxisSpacing: 25,
//           crossAxisSpacing: 25,
//           childAspectRatio: 150 / 180,
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           children: gridViewItems,
//         );
//       },
//     );
//   }
// }