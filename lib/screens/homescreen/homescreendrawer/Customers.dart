import 'dart:async';
import 'dart:math' as math;

import 'package:book_bank/components/widgets/indicators.dart';
import 'package:book_bank/extensions/color_extensions.dart';
import 'package:book_bank/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Customers extends StatefulWidget {
  static const String id = 'Customers';

  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  // Variables for customer data and calculated metrics
  List<Customer>? customerData; // Nullable List<Customer>
  double? conversionRate; // Nullable double
  double? averageOrderValue; // Nullable double
  double? clv; // Nullable double
  double? churnRate; // Nullable double

  @override
  void initState() {
    super.initState();
    // Fetch customer data and calculate metrics
    retrieveCustomerData();
    analyzeCustomerBehavior();
    calculateKeyMetrics();
  }

  // Function to retrieve customer data from the database
  void retrieveCustomerData() {
    // Implementation to fetch customer data from the database
    // Assign the fetched data to the 'customerData' list
    // Example:
    customerData = fetchCustomerDataFromDatabase();
  }

  // Function to analyze customer behavior
  void analyzeCustomerBehavior() {
    // Implementation for customer behavior analysis
    // Use techniques like segmentation, cohort analysis, and RFM analysis
    // Modify the 'customerData' list or create new variables to store analysis results
    // Example:
    performSegmentation();
    performCohortAnalysis();
    calculateRFMScores();
  }

  // Function to calculate key metrics
  void calculateKeyMetrics() {
    // Implementation for calculating metrics like conversion rate, average order value, CLV, and churn rate
    // Modify the respective metric variables declared earlier
    // Example:
    conversionRate = calculateConversionRate();
    averageOrderValue = calculateAverageOrderValue();
    clv = calculateCustomerLifetimeValue();
    churnRate = calculateChurnRate();
  }

  String exportSelection =
      'all_customers'; // Assuming 'all_customers' is the default option
  String exportFormat =
      'csv_spreadsheet'; // Assuming 'csv_spreadsheet' is the default option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFcc99ff),
                  Color(0xFFd9b3ff),
                  Color(0xFFcc99ff),
                ]),
          ),
        ),

        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xFFf2e6ff)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 7.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.purpleAccent),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Add your notification logic here
              },
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withOpacity(0.4),
                  spreadRadius: 2.0,
                  blurRadius: 3.0,
                  offset: Offset(0, 2),
                ),
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://forbes.es/wp-content/uploads/2022/06/topgun.jpg'),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Customers',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Montserrat',
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 35.0,
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.purple,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: PopupMenuButton<String>(
                            icon: Icon(Icons.more_horiz,
                                size: 25, color: Colors.purple),
                            onSelected: (String value) {
                              if (value == 'export') {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Export'),
                                      content: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text('Popup screen for export'),
                                          Text('Exports:'),
                                          RadioListTile(
                                            title: Text('All Customers'),
                                            value: 'all_customers',
                                            groupValue: exportSelection,
                                            onChanged: (value) {
                                              setState(() {
                                                exportSelection = value!;
                                              });
                                            },
                                          ),
                                          RadioListTile(
                                            title: Text('Current Page'),
                                            value: 'current_page',
                                            groupValue: exportSelection,
                                            onChanged: (value) {
                                              setState(() {
                                                exportSelection = value!;
                                              });
                                            },
                                          ),
                                          SizedBox(height: 16),
                                          Text('Exports as:'),
                                          RadioListTile(
                                            title: Text(
                                                'CSV for Excel, Numbers, or other spreadsheet programs'),
                                            value: 'csv_spreadsheet',
                                            groupValue: exportFormat,
                                            onChanged: (value) {
                                              setState(() {
                                                exportFormat = value!;
                                              });
                                            },
                                          ),
                                          RadioListTile(
                                            title: Text('Plain CSV file'),
                                            value: 'csv_plain',
                                            groupValue: exportFormat,
                                            onChanged: (value) {
                                              setState(() {
                                                exportFormat = value!;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            elevation: 4.0,
                                            shadowColor:
                                            Colors.purple.withOpacity(0.4),
                                          ),
                                          child: Text(
                                            'Close',
                                            style: TextStyle(
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.purpleAccent,
                                            elevation: 4.0,
                                            shadowColor:
                                            Colors.purple.withOpacity(0.4),
                                          ),
                                          child: Text('Exports Customers'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (value == 'import') {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Import'),
                                      content: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                              child: Text(
                                                'Add file',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            elevation: 4.0,
                                            shadowColor:
                                            Colors.purple.withOpacity(0.4),
                                          ),
                                          child: Text(
                                            'Close',
                                            style: TextStyle(
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.purpleAccent,
                                            elevation: 4.0,
                                            shadowColor:
                                            Colors.purple.withOpacity(0.4),
                                          ),
                                          child: Text('Import Customers'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return {'export', 'import'}.map((String choice) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Text(choice),
                                );
                              }).toList();
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          // Add "Add customers" logic here'
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purpleAccent,
                          elevation: 4.0,
                          // Add elevation for shadow effect
                          shadowColor: Colors.purple.withOpacity(0.4),
                          // Set shadow color
                          minimumSize: Size(70.0, 35.0), //  Set custom size
                        ),
                        child: Text(
                          'Add Customers',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xFFf2e6ff),
                    // Use the provided color code for the 'Dashboard' text
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.4),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Summary',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Conversion Rate: ${conversionRate?.toStringAsFixed(2)}%',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        'Average Order Value: \$${averageOrderValue?.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        'Customer Lifetime Value: \$${clv?.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        'Churn Rate: ${churnRate?.toStringAsFixed(2)}%',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.purple,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.4),
                                spreadRadius: 2.0,
                                blurRadius: 4.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: PieChartSample2(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.0),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.4),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search customers',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.purpleAccent),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.swap_vert,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              performSegmentation(),

              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFFf2e6ff),
                  // Use the provided color code for the 'Dashboard' text
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.4),
                      spreadRadius: 2.0,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sales Trends',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              // Implementation for displaying sales trends
              // Example:

              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      // Use the provided color code for the 'Dashboard' text
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.4),
                          spreadRadius: 2.0,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: LineChartSample7()),
              ),

              SizedBox(height: 20.0),

              SizedBox(height: 20.0),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.4),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Customer Retention',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Total Customers:',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                              SizedBox(width: 20.0),
                              Text(
                                '1456',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xFFf2e6ff),
                            // Use the provided color code for the 'Dashboard' text
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.4),
                                spreadRadius: 2.0,
                                blurRadius: 4.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: PieChartSample1()),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
              // Implementation for displaying customer retention data
              // Example:
              // PieChart(
              //   // Chart data and settings
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example Customer class for reference
class Customer {
  final String name;
  final int? amount;
  final int? order;

  Customer({required this.name, required this.amount, required this.order});
// Customer properties
}

// Functions for fetching customer data and calculating metrics
List<Customer>? fetchCustomerDataFromDatabase() {
  // Implementation to fetch customer data from the database
  // Return the fetched data as a nullable List<Customer>
}

List<Customer> customerSegments = [
  Customer(name: 'John Doe', amount: 22, order: 25),
  Customer(name: 'Jane Smith', amount: 22, order: 30),
  Customer(name: 'Alice Johnson', amount: 22, order: 35),
];

Column performSegmentation() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListView.builder(
        shrinkWrap: true,
        itemCount: customerSegments.length,
        itemBuilder: (context, index) {
          Customer customer = customerSegments[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'CustomerDetailsScreen');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withOpacity(0.4),
                      spreadRadius: 2.0,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(customer.name),
                  subtitle: Text(
                      '${customer.order ?? 0} orders - Rs: ${customer.amount ?? 0}'),
                ),
              ),
            ),
          );
        },
      ),
    ],
  );

  // Implementation for customer segmentation
}

void performCohortAnalysis() {
  // Implementation for cohort analysis
}

void calculateRFMScores() {
  // Implementation for calculating RFM scores
}

double? calculateConversionRate() {
  return 40;
  // Implementation for calculating conversion rate
  // Return the calculated conversion rate as a nullable double value
}

double? calculateAverageOrderValue() {
  return 30;
  // Implementation for calculating average order value
  // Return the calculated average order value as a nullable double value
}

double? calculateCustomerLifetimeValue() {
  return 15;
  // Implementation for calculating customer lifetime value
  // Return the calculated customer lifetime value as a nullable double value
}

double? calculateChurnRate() {
  return 15;
  // Implementation for calculating churn rate
  // Return the calculated churn rate as a nullable double value
}


// USING
class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              indicators(
                color: AppColors.contentColorBlue,
                text: 'COR',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              indicators(
                color: AppColors.contentColorYellow,
                text: 'AVO',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              indicators(
                color: AppColors.contentColorPurple,
                text: 'CLV',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              indicators(
                color: AppColors.contentColorGreen,
                text: 'CHR',
                isSquare: true,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.contentColorPurple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}






// USING
class LineChartSample7 extends StatelessWidget {
  LineChartSample7({
    super.key,
    Color? line1Color,
    Color? line2Color,
    Color? betweenColor,
  })  : line1Color = line1Color ?? AppColors.contentColorRed,
        line2Color = line2Color ?? AppColors.contentColorPurple,
        betweenColor =
            betweenColor ?? AppColors.contentColorGreen.withOpacity(0.5);

  final Color line1Color;
  final Color line2Color;
  final Color betweenColor;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: Colors.deepPurple,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
      color: Colors.deepPurple,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        '\$ ${value + 0.5}',
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 18,
          top: 10,
          bottom: 4,
        ),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 4),
                  FlSpot(1, 3.5),
                  FlSpot(2, 4.5),
                  FlSpot(3, 1),
                  FlSpot(4, 4),
                  FlSpot(5, 6),
                  FlSpot(6, 6.5),
                  FlSpot(7, 6),
                  FlSpot(8, 4),
                  FlSpot(9, 6),
                  FlSpot(10, 6),
                  FlSpot(11, 7),
                ],
                isCurved: true,
                barWidth: 2,
                color: line1Color,
                dotData: FlDotData(
                  show: false,
                ),
              ),
              LineChartBarData(
                spots: const [
                  FlSpot(0, 7),
                  FlSpot(1, 3),
                  FlSpot(2, 4),
                  FlSpot(3, 2),
                  FlSpot(4, 3),
                  FlSpot(5, 4),
                  FlSpot(6, 5),
                  FlSpot(7, 3),
                  FlSpot(8, 1),
                  FlSpot(9, 8),
                  FlSpot(10, 1),
                  FlSpot(11, 3),
                ],
                isCurved: false,
                barWidth: 2,
                color: line2Color,
                dotData: FlDotData(
                  show: false,
                ),
              ),
            ],
            betweenBarsData: [
              BetweenBarsData(
                fromIndex: 0,
                toIndex: 1,
                color: betweenColor,
              )
            ],
            minY: 0,
            borderData: FlBorderData(
              show: false,
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: leftTitleWidgets,
                  interval: 1,
                  reservedSize: 36,
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 1,
              checkToShowHorizontalLine: (double value) {
                return value == 1 || value == 6 || value == 4 || value == 5;
              },
            ),
          ),
        ),
      ),
    );
  }
}

// USING
class PieChartSample1 extends StatefulWidget {
  const PieChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSample1State();
}

class PieChartSample1State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.deepPurple,
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.4),
                    spreadRadius: 2.0,
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  indicators(
                    color: AppColors.contentColorBlue,
                    text: 'Active',
                    isSquare: false,
                    size: touchedIndex == 0 ? 18 : 16,
                    textColor: touchedIndex == 0
                        ? AppColors.mainTextColor1
                        : AppColors.mainTextColor3,
                  ),
                  indicators(
                    color: AppColors.contentColorYellow,
                    text: 'InActive',
                    isSquare: false,
                    size: touchedIndex == 1 ? 18 : 16,
                    textColor: touchedIndex == 1
                        ? AppColors.mainTextColor1
                        : AppColors.mainTextColor3,
                  ),
                  indicators(
                    color: AppColors.contentColorPink,
                    text: 'Churend',
                    isSquare: false,
                    size: touchedIndex == 2 ? 18 : 16,
                    textColor: touchedIndex == 2
                        ? AppColors.mainTextColor1
                        : AppColors.mainTextColor3,
                  ),
                  indicators(
                    color: AppColors.contentColorGreen,
                    text: 'Repeat',
                    isSquare: false,
                    size: touchedIndex == 3 ? 18 : 16,
                    textColor: touchedIndex == 3
                        ? AppColors.mainTextColor1
                        : AppColors.mainTextColor3,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  startDegreeOffset: 180,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 1,
                  centerSpaceRadius: 0,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
          (i) {
        final isTouched = i == touchedIndex;
        const color0 = AppColors.contentColorBlue;
        const color1 = AppColors.contentColorYellow;
        const color2 = AppColors.contentColorPink;
        const color3 = AppColors.contentColorGreen;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0,
              value: 35,
              title: '35%',
              radius: 80,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                  color: AppColors.contentColorWhite, width: 6)
                  : BorderSide(
                  color: AppColors.contentColorWhite.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: color1,
              value: 40,
              title: '40%',
              radius: 65,
              titlePositionPercentageOffset: 0.63,
              borderSide: isTouched
                  ? const BorderSide(
                  color: AppColors.contentColorWhite, width: 6)
                  : BorderSide(
                  color: AppColors.contentColorWhite.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              color: color2,
              value: 15,
              title: '15%',
              radius: 60,
              titlePositionPercentageOffset: 0.7,
              borderSide: isTouched
                  ? const BorderSide(
                  color: AppColors.contentColorWhite, width: 6)
                  : BorderSide(
                  color: AppColors.contentColorWhite.withOpacity(0)),
            );
          case 3:
            return PieChartSectionData(
              color: color3,
              value: 10,
              title: '10%',
              radius: 70,
              titlePositionPercentageOffset: 0.65,
              borderSide: isTouched
                  ? const BorderSide(
                  color: AppColors.contentColorWhite, width: 6)
                  : BorderSide(
                  color: AppColors.contentColorWhite.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}




class CustomerDetailsScreen extends StatelessWidget {
  static const String id = 'CustomerDetailsScreen';

  final String customerName;
  final String customerLocation;
  final int orderCount;
  final double amount;

  CustomerDetailsScreen({
    required this.customerName,
    required this.customerLocation,
    required this.orderCount,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFe6e6ff),
        // Use the provided color code for appbar background
        elevation: 4,
        // Add elevation for the appbar
        shadowColor: Color(0xFFcc66ff),
        title: const Text(
          'Customer Details',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(
                0xFF9900CC), // Use the provided color code for the 'Dashboard' text
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purpleAccent.withOpacity(0.4),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CustomAlertDialog(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purpleAccent.withOpacity(0.4),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // First Circle Box
                            SizedBox(
                              width: 75,
                            ),
                            // Second Circle Box
                            ClipOval(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 73,
                                  backgroundColor: Color(0xfff9e6ff),
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundImage: NetworkImage(
                                        'https://pyxis.nymag.com/v1/imgs/7c8/9d3/c493bf97f12f53fa7649f21d67a0bfb2b8-Cillian-Murphy.jpg'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      // Text 'John Doe'
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Montserrat',
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Text 'ADBC013@gmail.com'
                      Text(
                        'ADBC013@gmail.com',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Montserrat',
                          color: Color(0xffecb3ff),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '+92 3132122329',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Montserrat',
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Horizontal Bar
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          height: 1,
                          color: Color(0xffecb3ff),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ElevatedButton for email
                          ElevatedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return EmailPopupScreen();
                                },
                              );
                              // Implement the action for the email button here
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              elevation: 4.0,
                              shadowColor: Colors.purple.withOpacity(0.4),
                            ),
                            icon: Icon(Icons.email),
                            label: Text('Email'),
                          ),
                          // ElevatedButton for phone
                          ElevatedButton.icon(
                            onPressed: () {
                              // Implement the action for the phone button here
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              elevation: 4.0,
                              shadowColor: Colors.purple.withOpacity(0.4),
                            ),
                            icon: Icon(Icons.phone),
                            label: Text('Text'),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purpleAccent.withOpacity(0.4),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Geographics',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.deepPurple,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          color: Color(0xFFecb3ff),
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Center(
                          // Step 1: Wrap the Row with Center widget
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFf9e6ff),
                                  //f9e6ff
                                  spreadRadius: 2.0,
                                  blurRadius: 4.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    // Step 2: Wrap the Icon with Align widget
                                    alignment: Alignment.center,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.purpleAccent[700],
                                        borderRadius:
                                        BorderRadius.circular(4.0),
                                      ),
                                      width: 50.0,
                                      height: 50.0,
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                        size: 45.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        // Step 2: Wrap the "Contact" text with Align widget
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Contact',
                                          style: TextStyle(
                                            color: Color(0XFFE0AAFF),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '+92 313 2122329',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.purpleAccent[700],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Center(
                          // Step 1: Wrap the Row with Center widget
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFf9e6ff),
                                  //f9e6ff
                                  spreadRadius: 2.0,
                                  blurRadius: 4.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    // Step 2: Wrap the Icon with Align widget
                                    alignment: Alignment.center,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple[700],
                                        borderRadius:
                                        BorderRadius.circular(4.0),
                                      ),
                                      width: 50.0,
                                      height: 50.0,
                                      child: Icon(
                                        Icons.location_city_sharp,
                                        color: Colors.white,
                                        size: 45.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        // Step 2: Wrap the "Contact" text with Align widget
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Address',
                                          style: TextStyle(
                                            color: Color(0XFFE0AAFF),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '123 Street, New York',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.deepPurple[700],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Center(
                          // Step 1: Wrap the Row with Center widget
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFf9e6ff),
                                  //f9e6ff
                                  spreadRadius: 2.0,
                                  blurRadius: 4.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    // Step 2: Wrap the Icon with Align widget
                                    alignment: Alignment.center,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurpleAccent[700],
                                        borderRadius:
                                        BorderRadius.circular(4.0),
                                      ),
                                      width: 50.0,
                                      height: 50.0,
                                      child: Icon(
                                        Icons.smart_screen_outlined,
                                        color: Colors.white,
                                        size: 45.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        // Step 2: Wrap the "Contact" text with Align widget
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Last Visit',
                                          style: TextStyle(
                                            color: Color(0XFFE0AAFF),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'February 24, 2021',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.deepPurpleAccent[700],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purpleAccent.withOpacity(0.4),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Orders',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.deepPurple,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          color: Color(0xFFecb3ff),
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Center(
                          // Step 1: Wrap the Row with Center widget
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFf9e6ff),
                                  //f9e6ff
                                  spreadRadius: 2.0,
                                  blurRadius: 4.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 16.0),
                                Column(

                                  children: [

                                    Row(
                                      children: [
                                        Text(
                                          'Total:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Colors.deepPurple,
                                          ),
                                        ),
                                        SizedBox(width: 120,),
                                        Text(
                                          '56',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.deepPurple,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Text(
                                          'Sale:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(width: 150,),
                                        Text(
                                          '50',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.purpleAccent,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Text(
                                          'Donate:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(width: 125,),
                                        Text(
                                          '4',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.purpleAccent,
                                          ),
                                        ),
                                      ],
                                    ),


                                    Row(
                                      children: [
                                        Text(
                                          'Exchange:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        SizedBox(width: 100,),
                                        Text(
                                          '2',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.purpleAccent,
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],

                                ),
                                SizedBox(width: 10.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purpleAccent.withOpacity(0.4),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),

                  child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Revenue',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.deepPurple,
                          ),
                        ),
                        SizedBox(height: 20),

                        Text(
                          '\$\19000.89',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            color: Color(0xFFecb3ff),
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 20),



                      ]
                  ),


                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}





class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            SizedBox(
              width: 180,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {
                    _showPopupMenu(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void _showPopupMenu(BuildContext context) {
    final RenderBox overlay =
    Overlay.of(context)?.context!.findRenderObject() as RenderBox;
    final RenderBox popupButton = context.findRenderObject() as RenderBox;
    final offset = popupButton.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + popupButton.size.height,
        offset.dx + popupButton.size.width,
        offset.dy + popupButton.size.height + 10.0,
      ),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          child: ElevatedButton(
            onPressed: () {
              // Implement the action for deleting the customer here
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              elevation: 4.0,
              shadowColor: Colors.purple.withOpacity(0.4),
            ),
            child: Text('Delete Customer'),
          ),
          // Implement the action for Option 1 here
          onTap: () {},
        ),
      ],
    );
  }
}

class EmailPopupScreen extends StatefulWidget {
  @override
  _EmailPopupScreenState createState() => _EmailPopupScreenState();
}

class _EmailPopupScreenState extends State<EmailPopupScreen> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Contact customer',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // Adjust container properties here (e.g., padding, margin, etc.)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 1,
                  color: Color(0xffecb3ff),
                ),
                SizedBox(height: 10),

                Text(
                  'To',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffecb3ff),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'khanghilman96@gmail.com',
                        labelStyle: TextStyle(
                          fontSize: 10,
                          color: Color(0xFFff99ff),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Adjust the spacing between fields if needed
                Text(
                  'From',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10),
                // Adjust the spacing between fields if needed

                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffecb3ff),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextField()),
                SizedBox(height: 10),
                Text(
                  'Send bcc to:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                RadioListTile(
                  title: Text(
                    'kgullu079@gmail.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.purple,
                    ),
                  ),
                  value: true, // Set the appropriate value here
                  groupValue: true, // Set the appropriate group value here
                  onChanged: (value) {
                    // Implement the logic when the radio button is selected/unselected
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Subject',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffecb3ff),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Message from {{ shop.name }}',
                        labelStyle: TextStyle(
                          fontSize: 10,
                          color: Color(0xFFff99ff),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Custom message (optional)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffecb3ff),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Write email',
                        labelStyle: TextStyle(
                          fontSize: 10,
                          color: Color(0xFFff99ff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return EmailPopupScreen1();
              },
            );
            // Implement the action for erasing personal data here
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.purpleAccent,
            elevation: 4.0,
            shadowColor: Colors.purple.withOpacity(0.4),
          ),
          child: Text('Review Email'),
        ),
      ],
    );
  }
}

class EmailPopupScreen1 extends StatefulWidget {
  @override
  _EmailPopupScreen1State createState() => _EmailPopupScreen1State();
}

class _EmailPopupScreen1State extends State<EmailPopupScreen1> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Contact customer',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // Adjust container properties here (e.g., padding, margin, etc.)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 1,
                  color: Color(0xffecb3ff),
                ),
                SizedBox(height: 10),

                Text(
                  'To:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'My Store" <kgullu079@gmail.com>',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.purpleAccent,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  'To:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'jane.doe@shopify.com',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.purpleAccent,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  'Subject:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Message from My Store',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.purpleAccent,
                  ),
                ),

                SizedBox(height: 10),

                SizedBox(height: 10),
                // Adjust the spacing between fields if needed
                Text(
                  'From',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 20),
                // Adjust the spacing between fields if needed

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffecb3ff),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'My store',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.deepPurple,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 20),
                        SizedBox(height: 10),
                        Container(
                          height: 1,
                          color: Color(0xffecb3ff),
                        ),
                      ],
                    ),
                    width: 250,
                    height: 400,
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(height: 20),

                SizedBox(height: 10),

                SizedBox(height: 20),

                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Back'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            // Implement the action for erasing personal data here
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.purpleAccent,
            elevation: 4.0,
            shadowColor: Colors.purple.withOpacity(0.4),
          ),
          child: Text('Send Email'),
        ),
      ],
    );
  }
}
