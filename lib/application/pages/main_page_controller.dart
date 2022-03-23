import 'package:curso_ifal_flutter/application/models/appointment.dart';
import 'package:curso_ifal_flutter/application/models/appointment_time.dart';
import 'package:curso_ifal_flutter/application/models/patient.dart';

class MainPageController {
  Future<List<Appointment>> loadAppointments() async {
    await Future.delayed(const Duration(seconds: 2));

    Appointment appointment = Appointment(
      patient: Patient('assets/images/eu-perfil.png', 'Thiago Sales'),
      description: 'Canal dentário',
      appointmentTime: AppointmentTime(
        DateTime(2022, 3, 20, 10, 30),
        DateTime(2022, 3, 20, 11, 0),
      ),
      isConfirmed: true,
    );

    return [appointment, appointment, appointment, appointment];
  }
}
