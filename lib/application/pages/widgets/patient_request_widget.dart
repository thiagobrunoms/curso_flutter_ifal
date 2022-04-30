import 'package:curso_ifal_flutter/application/models/appointment.dart';
import 'package:curso_ifal_flutter/layout/colors.dart';
import 'package:flutter/material.dart';

class PatientRequestWidget extends StatelessWidget {
  final Appointment appointment;

  const PatientRequestWidget({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, right: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 5,
              height: 70,
              color: appointment.isConfirmed ? Colors.green : Colors.orange),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(appointment.patient.profilePicturePath),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildPatientRequestList(appointment),
          ),
          Container(
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
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
}
