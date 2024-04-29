import 'package:shared_preferences/shared_preferences.dart';

class preferences{
static  SharedPreferences? prefs;
static const PERSON_NAME ='person_name';
static const NAME_COMPANY = 'name_company';
static const PERSON_NUMBER ='person_number';

static Future init() async => prefs =  await SharedPreferences.getInstance();


static Future setPerson(String person_name) async => await prefs?.setString(PERSON_NAME, person_name);
static String? getname() => prefs?.getString(PERSON_NAME);

  static Future setCompany(String name_company) async => await prefs?.setString(NAME_COMPANY, name_company);
  static String? getcompany() => prefs?.getString(NAME_COMPANY);

  static Future setNumber(String person_number) async => await prefs?.setString(PERSON_NUMBER, person_number);
  static String? getnumber()=> prefs?.getString(PERSON_NUMBER);

}