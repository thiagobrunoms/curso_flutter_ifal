import 'package:curso_ifal_flutter/application/models/appointment.dart';
import 'package:curso_ifal_flutter/application/models/appointment_time.dart';
import 'package:curso_ifal_flutter/application/models/patient.dart';
import 'package:curso_ifal_flutter/application/pages/widgets/main_page_bar_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Appointment appointment;
  @override
  void initState() {
    super.initState();

    appointment = Appointment(
      patient: Patient('../../', 'Thiago Sales'),
      description: 'Canal dentário',
      appointmentTime: AppointmentTime(
        DateTime(2022, 3, 20, 10, 30),
        DateTime(2022, 3, 20, 11, 0),
      ),
      isConfirmed: true,
    );
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 5,
                      height: 70,
                      color: appointment.isConfirmed
                          ? Colors.green
                          : Colors.orange),
                  const SizedBox(width: 12),
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/images/eu-perfil.png'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildPatientRequestList(appointment),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatientRequestList(Appointment appointment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${appointment.patient.name}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '${appointment.description}',
          style: TextStyle(color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            '${appointment.formatAppointmentTime()}',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ],
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
