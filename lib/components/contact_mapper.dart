import 'package:demo_views/components/mapper.dart';
import 'package:demo_views/demo_views.dart';
import 'package:demo_views/models/IPersonalContact.dart';

class ContactMapper implements Mapper<IPersonalContact ,PersonalContact> {
  @override
  PersonalContact call(IPersonalContact object) {
    return PersonalContact(
      name: object.name,
      email: object.email,
      number: object.number,
      status: object.status
    );
  }
}