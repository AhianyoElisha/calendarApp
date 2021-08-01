import 'package:calendar_store/calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:calendar_store/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:calendar_store/calendar/db.dart';
import 'package:calendar_store/calendar/calendar_model.dart';
import 'package:calendar_store/main/screens/details/details-screen.dart';
import 'package:intl/intl.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  Map<DateTime, List<dynamic>> _events = {};
  List<dynamic> _eventsFetch = [];
  List<CalendarItem> _data = [];

  void initState() {
    super.initState();
    DB.init().then((value) => _fetchEvents());
  }

  void dispose() {
    super.dispose();
  }

  void _fetchEvents() async {
    _events = {};
    List<Map<String, dynamic>> _results = await DB.query(CalendarItem.table);
    _data = _results.map((item) => CalendarItem.fromMap(item)).toList();
    _data.forEach((element) {
      DateTime formattedDate = DateTime.parse(DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(element.date.toString())));
      if (_events.containsKey(formattedDate)) {
        _events[formattedDate]!.add([
          element.code.toString(),
          element.name.toString(),
          element.description.toString()
        ]);
        _eventsFetch.add([
          element.code.toString(),
          element.name.toString(),
          element.description.toString()
        ]);
      } else {
        _events[formattedDate] = [
          [
            element.code.toString(),
            element.name.toString(),
            element.description.toString()
          ]
        ];
        _eventsFetch.add([
          element.code.toString(),
          element.name.toString(),
          element.description.toString()
        ]);
      }
    });
    setState(() {});
  }

  Widget ItemCard(var d, String svgSrc, var destination) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 10,
            color: Theme.of(context).primaryColorLight,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return destination;
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.only(bottom: 25, left: 30, right: 30),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.13),
                    shape: BoxShape.rectangle,
                  ),
                  child: SvgPicture.asset(
                    svgSrc,
                    width: size.width * 0.18,
                    // size.width * 0.18 means it use 18% of total width
                  ),
                ),
                Text(d[0], style: Theme.of(context).primaryTextTheme.headline1),
                SizedBox(height: 10),
                Text(d[1], style: Theme.of(context).primaryTextTheme.headline2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> get _eventWidgets => _eventsFetch
      .map((e) => ItemCard(e, "assets/icons/burger_beer.svg", DetailsScreen()))
      .toList();
  @override
  Widget build(BuildContext context) {
    _events = store.get("selectedEvent");
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[Row(children: _eventWidgets)],
      ),
    );
  }
}
