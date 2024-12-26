import 'package:flutter/material.dart';
import 'package:min_shop_app/pages/food_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String? seatValue;
  String? timeValue;
  final List<String> seatItems = ['小桌（2座）', '中桌（4座）', '大桌（8座）', '房间（12座）'];
  final List<String> timeItems = [
    '08:00-10:00',
    '10:00-12:00',
    '12:00-14:00',
    '16:00-18:00',
    '18:00-20:00'
  ];

  DateTime? selectDate;

  Future<void> _selectData(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: now.add(Duration(days: 7)));

    if (pickedDate != null && pickedDate != selectDate) {
      setState(() {
        selectDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            width: 300,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: DropdownButton(
                  value: seatValue,
                  padding: EdgeInsets.only(left: 10),
                  hint: Text('餐桌类型选择'),
                  items: seatItems.map((String item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      seatValue = newValue;
                    });
                  }),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: Container(
            width: 300,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(
                onPressed: () => _selectData(context),
                child: Text(
                  selectDate == null
                      ? '选择日期(未来7天)'
                      : "${selectDate!.year}-${selectDate!.month}-${selectDate!.day}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: Container(
            width: 300,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: DropdownButton(
                  value: timeValue,
                  padding: EdgeInsets.only(left: 10),
                  hint: Text('餐桌类型选择'),
                  items: timeItems.map((String item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      timeValue = newValue;
                    });
                  }),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: Container(
            height: 45,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.blue),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.zero),
                onPressed: () {
                  if (seatValue != null &&
                      timeValue != null &&
                      selectDate != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodPage(
                                date: selectDate!,
                                seatType: seatValue!,
                                timeSlot: timeValue!)));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('请完成所有选择')));
                  }
                },
                child: Text(
                  '确认',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          ),
        )
      ],
    );
  }
}
