import 'package:flutterloginui/calendar/event/event.dart';
import 'package:flutter/material.dart';
import 'package:flutterloginui/calendar/event/utils.dart';
import 'package:provider/provider.dart';
import 'package:flutterloginui/calendar/event/eventProvider.dart';


class EventEditingPage extends StatefulWidget {
  final Event? event;
  const EventEditingPage({
    Key? key,
    this.event
  }) : super(key: key);

  @override
  _EventEditingPageState createState() => _EventEditingPageState();

}

class _EventEditingPageState extends State<EventEditingPage> {
  final titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    }else{
      final event = widget.event!;

      titleController.text = event.title;
      fromDate = event.from;
      toDate = event.to;
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(

            leading: CloseButton(),
            actions: buildEditingActions(),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget> [
                  buildTitle(),
                  SizedBox(height: 12),
                  buildDateTimePickers()
                ],
              ),
            ),
          ),
    );
  }

  List<Widget> buildEditingActions() => [
  ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      primary: Colors.transparent,
      shadowColor: Colors.transparent,
    ),
      onPressed: saveForm,
      icon: Icon(Icons.done, color: Colors.black,),
      label: Text("SAVE",style: TextStyle(color: Colors.black),) )
  ];

 Widget buildTitle() => TextFormField(
   style: TextStyle(fontSize: 24),
   decoration: InputDecoration(
     border: UnderlineInputBorder(),
     hintText: "Add Course Title"
   ),
   onFieldSubmitted: (_) => saveForm(),
   validator: (title) =>
   title != null && title.isEmpty ? "Course title cannot be empty" : null,
   controller: titleController,
 );

 Widget buildDateTimePickers() => Column(
   children: [
      buildFrom(),
      buildTo(),
   ],
 );

 Widget buildFrom() => buildHeader(
   header: "FROM",
   child: Row(
     children: [
       Expanded(
         flex: 2,
         child: buildDropDownField(
           text: Utils.toDate(fromDate),
           onClicked: () => pickFromDateTime(pickDate: true)
         ),
       ),
       Expanded(
         child: buildDropDownField(
             text: Utils.toTime(fromDate),
             onClicked: () => pickFromDateTime(pickDate: false),
         ),
       )
     ],
   ),
 );


 Future pickFromDateTime({required bool pickDate}) async{
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;
    if (date.isAfter(toDate)){
        DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }
    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async{
    final date = await pickDateTime(toDate, pickDate: pickDate,
        firstDate: pickDate ? fromDate: null);
    if (date == null) return;
    if (date.isAfter(toDate)){
      DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }
    setState(() => toDate = date);
  }

  Future <DateTime?> pickDateTime(DateTime initialDate,
      {required bool pickDate,
        DateTime? firstDate,})
  async {
    if (pickDate) {
      final date  = await showDatePicker(context: context,
          initialDate: initialDate, firstDate: firstDate ?? DateTime(2015,8),
          lastDate: DateTime(2101));
      if (date == null) return null;
      final time = Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    }
    else{
      final timeOfDay = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(initialDate));
    if (timeOfDay == null) return null;

    final date = DateTime(initialDate.year, initialDate.month,
    initialDate.day);
    final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
    return date.add(time);
    }
  }


  Widget buildTo() => buildHeader(
    header: "TO",
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: buildDropDownField(
              text: Utils.toDate(toDate),
              onClicked: () => pickToDateTime(pickDate: true),
          ),
        ),
        Expanded(
          child: buildDropDownField(
              text: Utils.toTime(toDate),
              onClicked: () => pickToDateTime(pickDate: false),
          ),
        )
      ],
    ),
  );

  buildDropDownField({required String text, required VoidCallback onClicked})
  => ListTile(
    title: Text(text),
    trailing: Icon(Icons.arrow_drop_down),
    onTap: onClicked,
  );

  buildHeader({required String header,required Row child}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: TextStyle(fontWeight: FontWeight.bold),),
        child,
      ],
      );

Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if(isValid) {
      final event = Event (
        title: titleController.text,
        description: 'Description',
        from: fromDate,
        to: toDate,
        isAllDay: false
      );

      final isEditing = widget.event != null;
      final provider = Provider.of<EventProvider>(context,listen: false);

      if (isEditing){
        provider.editEvents(event, widget.event!);

        Navigator.of(context).pop();
      }
      provider.addEvents(event);
      
      Navigator.of(context).pop();
    }
}


}
