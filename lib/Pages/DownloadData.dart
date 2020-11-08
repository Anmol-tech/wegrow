import 'package:firebase_database/firebase_database.dart';

class MakeCall {
  firebaseCalls(DatabaseReference databaseReference) async {
    DataSnapshot dataSnapshot = await databaseReference.once();
    Map<dynamic, dynamic> jsonResponse = dataSnapshot.value['Testimonial'];
    // print(jsonResponse);

    return jsonResponse.values.toList();
  }

  firebaseBannerCalls(DatabaseReference databaseReference) async {
    DataSnapshot dataSnapshot = await databaseReference.once();
    Map<dynamic, dynamic> jsonResponse = dataSnapshot.value;

    // print(jsonResponse['Testimonial'].values;
    return jsonResponse;
  }
}
