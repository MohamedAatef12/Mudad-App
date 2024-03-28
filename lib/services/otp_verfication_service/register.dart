import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mudad_app/services/otp_verfication_service/twilio_controller.dart';
import 'package:mudad_app/services/otp_verfication_service/verify.dart';

import '../../app_constants/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controller = TextEditingController();

  String _phoneNumber = '';
  final phoneController = TextEditingController();

  String errorMessage = '';

  bool isLoading = false;
  final phoneFormKey = GlobalKey<FormState>();
  final List<String> allCountryISO = [
    'AF', // Afghanistan
    'AL', // Albania
    'DZ', // Algeria
    'AS', // American Samoa
    'AD', // Andorra
    'AO', // Angola
    'AI', // Anguilla
    'AQ', // Antarctica
    'AG', // Antigua and Barbuda
    'AR', // Argentina
    'AM', // Armenia
    'AW', // Aruba
    'AU', // Australia
    'AT', // Austria
    'AZ', // Azerbaijan
    'BS', // Bahamas
    'BH', // Bahrain
    'BD', // Bangladesh
    'BB', // Barbados
    'BY', // Belarus
    'BE', // Belgium
    'BZ', // Belize
    'BJ', // Benin
    'BM', // Bermuda
    'BT', // Bhutan
    'BO', // Bolivia (Plurinational State of)
    'BQ', // Bonaire, Sint Eustatius and Saba
    'BA', // Bosnia and Herzegovina
    'BW', // Botswana
    'BV', // Bouvet Island
    'BR', // Brazil
    'IO', // British Indian Ocean Territory
    'BN', // Brunei Darussalam
    'BG', // Bulgaria
    'BF', // Burkina Faso
    'BI', // Burundi
    'CV', // Cabo Verde
    'KH', // Cambodia
    'CM', // Cameroon
    'CA', // Canada
    'KY', // Cayman Islands
    'CF', // Central African Republic
    'TD', // Chad
    'CL', // Chile
    'CN', // China
    'CX', // Christmas Island
    'CC', // Cocos (Keeling) Islands
    'CO', // Colombia
    'KM', // Comoros
    'CD', // Congo (the Democratic Republic of the)
    'CG', // Congo
    'CK', // Cook Islands
    'CR', // Costa Rica
    'HR', // Croatia
    'CU', // Cuba
    'CW', // Curaçao
    'CY', // Cyprus
    'CZ', // Czech Republic
    'CI', // Côte d'Ivoire
    'DK', // Denmark
    'DJ', // Djibouti
    'DM', // Dominica
    'DO', // Dominican Republic
    'EC', // Ecuador
    'EG', // Egypt
    'SV', // El Salvador
    'GQ', // Equatorial Guinea
    'ER', // Eritrea
    'EE', // Estonia
    'SZ', // Eswatini
    'ET', // Ethiopia
    'FK', // Falkland Islands [Malvinas]
    'FO', // Faroe Islands
    'FJ', // Fiji
    'FI', // Finland
    'FR', // France
    'GF', // French Guiana
    'PF', // French Polynesia
    'TF', // French Southern Territories
    'GA', // Gabon
    'GM', // Gambia
    'GE', // Georgia
    'DE', // Germany
    'GH', // Ghana
    'GI', // Gibraltar
    'GR', // Greece
    'GL', // Greenland
    'GD', // Grenada
    'GP', // Guadeloupe
    'GU', // Guam
    'GT', // Guatemala
    'GG', // Guernsey
    'GN', // Guinea
    'GW', // Guinea-Bissau
    'GY', // Guyana
    'HT', // Haiti
    'HM', // Heard Island and McDonald Islands
    'VA', // Holy See
    'HN', // Honduras
    'HK', // Hong Kong
    'HU', // Hungary
    'IS', // Iceland
    'IN', // India
    'ID', // Indonesia
    'IR', // Iran (Islamic Republic of)
    'IQ', // Iraq
    'IE', // Ireland
    'IM', // Isle of Man
    'IT', // Italy
    'JM', // Jamaica
    'JP', // Japan
    'JE', // Jersey
    'JO', // Jordan
    'KZ', // Kazakhstan
    'KE', // Kenya
    'KI', // Kiribati
    'KP', // Korea (the Democratic People's Republic of)
    'KR', // Korea (the Republic of)
    'KW', // Kuwait
    'KG', // Kyrgyzstan
    'LA', // Lao People's Democratic Republic
    'LV', // Latvia
    'LB', // Lebanon
    'LS', // Lesotho
    'LR', // Liberia
    'LY', // Libya
    'LI', // Liechtenstein
    'LT', // Lithuania
    'LU', // Luxembourg
    'MO', // Macao
    'MG', // Madagascar
    'MW', // Malawi
    'MY', // Malaysia
    'MV', // Maldives
    'ML', // Mali
    'MT', // Malta
    'MH', // Marshall Islands
    'MQ', // Martinique
    'MR', // Mauritania
    'MU', // Mauritius
    'YT', // Mayotte
    'MX', // Mexico
    'FM', // Micronesia (Federated States of)
    'MD', // Moldova (the Republic of)
    'MC', // Monaco
    'MN', // Mongolia
    'ME', // Montenegro
    'MS', // Montserrat
    'MA', // Morocco
    'MZ', // Mozambique
    'MM', // Myanmar
    'NA', // Namibia
    'NR', // Nauru
    'NP', // Nepal
    'NL', // Netherlands
    'NC', // New Caledonia
    'NZ', // New Zealand
    'NI', // Nicaragua
    'NE', // Niger
    'NG', // Nigeria
    'NU', // Niue
    'NF', // Norfolk Island
    'MK', // North Macedonia
    'MP', // Northern Mariana Islands
    'NO', // Norway
    'OM', // Oman
    'PS', // Palestine
    'PK', // Pakistan
    'PW', // Palau
    'PS', // Palestine
    'PA', // Panama
    'PG', // Papua New Guinea
    'PY', // Paraguay
    'PE', // Peru
    'PH', // Philippines
    'PN', // Pitcairn
    'PL', // Poland
    'PT', // Portugal
    'PR', // Puerto Rico
    'QA', // Qatar
    'RO', // Romania
    'RU', // Russian Federation
    'RW', // Rwanda
    'RE', // Réunion
    'BL', // Saint Barthélemy
    'SH', // Saint Helena, Ascension and Tristan da Cunha
    'KN', // Saint Kitts and Nevis
    'LC', // Saint Lucia
    'MF', // Saint Martin (French part)
    'PM', // Saint Pierre and Miquelon
    'VC', // Saint Vincent and the Grenadines
    'WS', // Samoa
    'SM', // San Marino
    'ST', // Sao Tome and Principe
    'SA', // Saudi Arabia
    'SN', // Senegal
    'RS', // Serbia
    'SC', // Seychelles
    'SL', // Sierra Leone
    'SG', // Singapore
    'SX', // Sint Maarten (Dutch part)
    'SK', // Slovakia
    'SI', // Slovenia
    'SB', // Solomon Islands
    'SO', // Somalia
    'ZA', // South Africa
    'GS', // South Georgia and the South Sandwich Islands
    'SS', // South Sudan
    'ES', // Spain
    'LK', // Sri Lanka
    'SD', // Sudan
    'SR', // Suriname
    'SJ', // Svalbard and Jan Mayen
    'SE', // Sweden
    'CH', // Switzerland
    'SY', // Syrian Arab Republic
    'TW', // Taiwan (Province of China)
    'TJ', // Tajikistan
    'TZ', // Tanzania, United Republic of
    'TH', // Thailand
    'TL', // Timor-Leste
    'TG', // Togo
    'TK', // Tokelau
    'TO', // Tonga
    'TT', // Trinidad and Tobago
    'TN', // Tunisia
    'TR', // Turkey
    'TM', // Turkmenistan
    'TC', // Turks and Caicos Islands
    'TV', // Tuvalu
    'UG', // Uganda
    'UA', // Ukraine
    'AE', // United Arab Emirates
    'GB', // United Kingdom of Great Britain and Northern Ireland
    'UM', // United States Minor Outlying Islands
    'US', // United States of America
    'UY', // Uruguay
    'UZ', // Uzbekistan
    'VU', // Vanuatu
    'VE', // Venezuela (Bolivarian Republic of)
    'VN', // Viet Nam
    'VG', // Virgin Islands (British)
    'VI', // Virgin Islands (U.S.)
    'WF', // Wallis and Futuna
    'EH', // Western Sahara
    'YE', // Yemen
    'ZM', // Zambia
    'ZW', // Zimbabwe
  ];

  final List<String> arabCountryISO = [
    'SA', // Saudi Arabia
    'DZ', // Algeria
    'BH', // Bahrain
    'EG', // Egypt
    'IQ', // Iraq
    'JO', // Jordan
    'KW', // Kuwait
    'LB', // Lebanon
    'LY', // Libya
    'PS', // Palestine
    'MA', // Morocco
    'OM', // Oman
    'QA', // Qatar
    'SY', // Syria
    'TN', // Tunisia
    'AE', // United Arab Emirates
    'YE', // Yemen
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: Form(
            key: phoneFormKey,
            child: Column(
              children: [
                Text(
                  'Please enter your personal phone number'.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 50,
                ),
                InternationalPhoneNumberInput(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "phone required".tr;
                      }
                      return null;
                    },
                    countries: arabCountryISO,
                    initialValue: PhoneNumber(isoCode: 'SA'),
                    searchBoxDecoration: InputDecoration(
                      hintText: 'Search for a country'.tr,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.buttonColor),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    inputDecoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.buttonColor),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: "phone".tr,
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        size: 26,
                        color: Colors.grey.shade600,
                      ),
                      focusColor: AppColors.buttonColor,
                      fillColor: AppColors.buttonColor,
                      hoverColor: AppColors.buttonColor,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.buttonColor),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onInputChanged: (PhoneNumber number) {
                      log(number.phoneNumber.toString());
                      _phoneNumber = number.phoneNumber!;
                      log(_phoneNumber);
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                      useEmoji: true,
                    ),
                    textFieldController: phoneController),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    if (phoneFormKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });

                      String result = await TwilioVerification.instance
                          .sendCode(_phoneNumber);

                      setState(() {
                        isLoading = true;
                      });

                      if (result == 'Successful') {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyPage(
                                      phoneNumber: _phoneNumber,
                                    )));
                      } else {
                        setState(() {
                          errorMessage = result;
                          print(result.toString());
                        });
                      }
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ModalProgressHUD(
                        inAsyncCall: isLoading,
                        opacity: 0.5,
                        color: Colors.black,
                        progressIndicator: const SpinKitFadingCircle(
                          color: AppColors.buttonColor,
                          size: 50.0,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.grey,
                                width: 0.5),
                          ),
                          child: Text(
                            'Verify'.tr,
                            style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
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
    );
  }
}
