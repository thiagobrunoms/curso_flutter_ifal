import 'package:curso_ifal_flutter/application/models/appointment.dart';
import 'package:curso_ifal_flutter/application/models/appointment_time.dart';
import 'package:curso_ifal_flutter/application/models/patient.dart';
import 'package:curso_ifal_flutter/application/pages/main_page_controller.dart';
import 'package:curso_ifal_flutter/application/pages/widgets/main_page_bar_widget.dart';
import 'package:curso_ifal_flutter/application/pages/widgets/patient_request_widget.dart';
import 'package:curso_ifal_flutter/application/pages/main_page_controller.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int ourCurrentIndex = 0;
  late MainPageController controller;

  @override
  void initState() {
    super.initState();

    controller = MainPageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MainPageBarWidget(),
                  _buildNotificationIcon(),
                ],
              ),
              _buildAppointmentsList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(Icons.calendar_month),
                Text('Calendario'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.calendar_month),
                Text('Pedidos'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.calendar_month),
                Text('lakdfld'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentsList() {
    return FutureBuilder<List<Appointment>>(
      future: controller.loadAppointments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        List<Appointment> appointmentList = snapshot.data!;

        Map<int, Appointment> appointmentsMap = appointmentList.asMap();

        List<Widget> appointmentWidgets = appointmentsMap.entries
            .map((eachEntry) => _buildEachAppointment(eachEntry.value,
                eachEntry.key == (appointmentsMap.entries.length - 1)))
            .toList();

        return Card(
          child: Column(
            children: appointmentWidgets,
          ),
        );
      },
    );
  }

  Widget _buildEachAppointment(Appointment eachAppointment, bool isLast) {
    return Column(
      children: [
        PatientRequestWidget(
          appointment: eachAppointment,
        ),
        if (!isLast) _buildDivider(),
      ],
    );
  }

  Widget _buildDivider() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Divider(height: 15, color: Colors.grey.shade400),
    );
  }

  Widget _buildNotificationIcon() {
    return Stack(
      children: [
        const Icon(
          Icons.notifications_none,
          color: Color(0xFF133ef6),
          size: 35,
        ),
        Positioned(
          left: 20,
          child: Container(
            width: 10,
            height: 10,
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          ),
        )
      ],
    );
  }
}
