import 'package:flutter/material.dart';
import 'package:math/Maps/Widget/MainTextfield.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:math/Maps/Widget/MapAppBar.dart';

class PreBooking extends StatefulWidget {
  const PreBooking({super.key});

  @override
  State<PreBooking> createState() => _PreBookingState();
}

class _PreBookingState extends State<PreBooking> {
  late final AnimationController controller;
  PickerDateRange? _selectedRange; // To store the selected date range
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 250, 224, 1),
      body: CustomScrollView(
        slivers: [
          MapCustomAppBar(text: "Trip",),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(254, 250, 224, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SfDateRangePicker(
                minDate: DateTime.now(),
                maxDate: DateTime.now().add(Duration(days: 30)),
                enablePastDates: false,
                backgroundColor: const Color.fromRGBO(254, 250, 224, 1),
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange:
                    PickerDateRange(DateTime.now(), DateTime.now()),
                initialDisplayDate: DateTime.now(),
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  setState(() {
                    _selectedRange = args.value;
                  });
                  if (calculateTotalDaysSelected() <= 2) {
                    controller.animateTo(1);
                  } else {
                    controller.animateTo(0.5);
                  }
                  //print(_selectedRange!.startDate);
                },
                headerStyle: const DateRangePickerHeaderStyle(
                  backgroundColor: const Color.fromRGBO(254, 250, 224, 1),
                  textStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                monthCellStyle: const DateRangePickerMonthCellStyle(
                  todayTextStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                  blackoutDateTextStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                  disabledDatesTextStyle: TextStyle(
                    color: Color.fromARGB(77, 0, 0, 0),
                    fontSize: 14.0,
                  ),
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                yearCellStyle: const DateRangePickerYearCellStyle(
                  disabledDatesTextStyle: TextStyle(
                    color: Color.fromARGB(77, 243, 242, 242),
                    fontSize: 14.0,
                  ),
                  textStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                selectionColor: Colors.white,
                rangeSelectionColor: Colors.black,
                todayHighlightColor: Colors
                    .blue, // Replace 'themeColor.backgroundColor' with your desired color
                startRangeSelectionColor: Colors.green,
                endRangeSelectionColor: Colors.deepOrangeAccent,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(217, 4, 41, 1),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Choose Vehicle",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          MainTextField(drop: TextEditingController(), pickup: TextEditingController()),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromRGBO(139, 246, 144, 1),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(217, 4, 41, 1),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Available Trip",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  int calculateTotalDaysSelected() {
    if (_selectedRange != null &&
        _selectedRange!.startDate != null &&
        _selectedRange!.endDate != null) {
      return _selectedRange!.endDate!
              .difference(_selectedRange!.startDate!)
              .inDays +
          1;
    } else {
      return 0; // No range selected
    }
  }
}
