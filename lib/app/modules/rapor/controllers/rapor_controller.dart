import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RaporController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> dataMurid = {};
  Map<String, dynamic> dataRapor = {};
  Map<String, dynamic> infoMurid = Get.arguments;



  Future<void> fetchMuridDanRapor() async {
    QuerySnapshot docrapor =
        await _firestore.collection('student_report').where('student_id', isEqualTo: infoMurid['idMurid']).where('semester', isEqualTo: infoMurid['semester']).get();
    // dataRapor = docrapor.docs.first.data() as Map<String, dynamic>;
    if (docrapor.docs.isNotEmpty) {
        dataRapor = docrapor.docs.first.data() as Map<String, dynamic>;
      } else {
        dataRapor = {
          'semester': infoMurid['semester'] ?? '-',
          'religious_and_moral_values_development': '-',
          'physical_development': '-',
          'cognitive_development': '-',
          'social_emotional_development': '-',
          'language_development': '-',
          'artistic_development': '-',
          'body_weight': '-',
          'body_height': '-',
          'number_of_permit_days': '-',
          'number_of_sick_days': '-',
          'number_of_days_without_information': '-',
        };
      }

    DocumentSnapshot docmurid =
        await _firestore.collection('student').doc(infoMurid['idMurid']).get();
    dataMurid = docmurid.data() as Map<String, dynamic>;
    // print(doc.data() as Map<String, dynamic>);
    print(dataRapor["body_weight"]);
    print(dataMurid["name"]);
  }
  

}
