import 'package:flutter/cupertino.dart';
import 'package:mycustomers/app/local_setup.dart';
import 'package:mycustomers/core/constants/local_keys.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AppLocalizations {
  final Locale locale;
  Map<String, String> _sentences;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  Future<bool> load() async {
    final path = 'assets/languages/${locale.languageCode}.json';
    final data = await rootBundle.loadString(path);
    final Map<String, dynamic> _result = json.decode(data);

    _sentences = <String, String>{};
    _result.forEach((String key, dynamic value) {
      _sentences[key] = value.toString();
    });

    return true;
  }

  String translate(String key) {
    return _sentences[key];
  }


  //list of available local strings that the app can use
  String get onboardingWelcomeText => translate(LocalKeys.onboarding_welcome_text);
  String get onboardingWelcomeDesc => translate(LocalKeys.onboarding_welcome_desc);
  String get getStartedButton => translate(LocalKeys.getstarted_button);
  String get signIn => translate(LocalKeys.sign_in);
  String get pushAReminder => translate(LocalKeys.push_a_reminder);
  String get pushAReminderDesc => translate(LocalKeys.push_a_reminder_desc);
  String get collectYourMoney => translate(LocalKeys.collect_your_money);
  String get collectYourMoneyDesc => translate(LocalKeys.collect_your_money_desc);
  String get engagedWithYourPeople => translate(LocalKeys.engaged_with_your_people);
  String get engagedWithYourPeopleDesc => translate(LocalKeys.engaged_with_your_people_desc);
  String get signUp => translate(LocalKeys.sign_up);
  String get signUpEnterPhoneNumber => translate(LocalKeys.sign_up_enter_phone_number);
  String get continueWithSocialAccount => translate(LocalKeys.continue_with_social_account);
  String get alreadyAmemberSignIn => translate(LocalKeys.already_a_member_sign_in);
  String get notAMemberSignUp => translate(LocalKeys.not_a_member_sign_up);
  String get nextButton => translate(LocalKeys.next_button);
  String get verifyCode => translate(LocalKeys.verify_code);
  String get enter4DigitCode => translate(LocalKeys.enter_4_digit_code);
  String get verifyAndProceed => translate(LocalKeys.verify_and_proceed);
  String get verificationErrorMessage => translate(LocalKeys.verification_error_message);
  String get businessDetails => translate(LocalKeys.business_details);
  String get oneLastStep => translate(LocalKeys.one_last_step);
  String get enterYourFullName => translate(LocalKeys.enter_your_full_name);
  String get enterYourCompanyName => translate(LocalKeys.enter_your_company_name);
  String get submitAndFinish => translate(LocalKeys.submit_and_finish);
  String get customersOwingYou => translate(LocalKeys.customers_owing_you);
  String get peopleYouOwe => translate(LocalKeys.people_you_owe);
  String get customersAreOwingYou => translate(LocalKeys.customers_are_owing_you);
  String get customersOwingYouDesc => translate(LocalKeys.customers_owing_you_desc);
  String get addCustomersOwingYou => translate(LocalKeys.add_customers_owing_you);
  String get home => translate(LocalKeys.home);
  String get marketing => translate(LocalKeys.marketing);
  String get business => translate(LocalKeys.business);
  String get searchByName => translate(LocalKeys.search_by_name);
  String get youAreOwing => translate(LocalKeys.you_are_owing);
  String get addPeopleYouOwe => translate(LocalKeys.add_people_you_owe);
  String get peopleYouOweDesc => translate(LocalKeys.people_you_owe_desc);
  String get notifications => translate(LocalKeys.notifications);
  String get view => translate(LocalKeys.view);
  String get yourCompany => translate(LocalKeys.your_company);
  String get addCustomer => translate(LocalKeys.add_customer);
  String get help => translate(LocalKeys.help);
  String get signOut => translate(LocalKeys.sign_out);
  String get addBusiness => translate(LocalKeys.add_business);
  String get businessName => translate(LocalKeys.business_name);
  String get aboutBusiness => translate(LocalKeys.about_business);
  String get searchCustomers => translate(LocalKeys.search_customers);
  String get cancel => translate(LocalKeys.cancel);
  String get addNewCustomer => translate(LocalKeys.add_new_customer);
  String get addDebtorsFromContacts => translate(LocalKeys.add_debtors_from_contacts);
  String get addButton => translate(LocalKeys.add_button);
  String get addACustomer => translate(LocalKeys.add_a_customer);
  String get customerDetails => translate(LocalKeys.customer_details);
  String get enterNameOfDebtor => translate(LocalKeys.enter_name_of_debtor);
  String get continueButton => translate(LocalKeys.continue_button);
  String get addTransaction => translate(LocalKeys.add_transaction);
  String get transactionDesc => translate(LocalKeys.transaction_desc);
  String get downloadReport => translate(LocalKeys.download_report);
  String get sendReminder => translate(LocalKeys.send_reminder);
  String get addDebit => translate(LocalKeys.add_debit);
  String get addCredit => translate(LocalKeys.add_credit);
  String get sms => translate(LocalKeys.sms);
  String get call => translate(LocalKeys.call);
  String get setReminder => translate(LocalKeys.set_reminder);
  String get viewHistory => translate(LocalKeys.view_history);
  String get owesYou => translate(LocalKeys.owes_you);
  String get enterAmount => translate(LocalKeys.enter_amount);
  String get selectDueDate => translate(LocalKeys.select_due_date);
  String get enterItemspurchased => translate(LocalKeys.enter_items_purchased);
  String get save => translate(LocalKeys.save);
  String get borrowedYou => translate(LocalKeys.borrowed_you);
  String get itemsPurchased => translate(LocalKeys.items_purchased);
  String get costOfItems => translate(LocalKeys.cost_of_items);
  String get amountPaid => translate(LocalKeys.amount_paid);
  String get amountOwing => translate(LocalKeys.amount_owing);
  String get shareTo => translate(LocalKeys.share_to);
  String get share => translate(LocalKeys.share);
  String get typeAHeading => translate(LocalKeys.type_a_heading);
  String get startTypingYourmessage => translate(LocalKeys.start_typing_your_message);
  String get schedule => translate(LocalKeys.schedule);
  String get sendCapital => translate(LocalKeys.send_capital);
  String get scheduleReminder => translate(LocalKeys.schedule_reminder);
  String get reminderDate => translate(LocalKeys.reminder_date);
  String get transactionHistory => translate(LocalKeys.transaction_history);
  String get selectDate => translate(LocalKeys.select_date);
  String get payedYou => translate(LocalKeys.payed_you);
  String get details => translate(LocalKeys.details);
  String get transaction => translate(LocalKeys.transaction);
  String get deliverables => translate(LocalKeys.deliverables);
  String get completedPayment => translate(LocalKeys.completed_payment);
  String get setRemindsDate => translate(LocalKeys.set_reminds_date);
  String get setRemDateDesc => translate(LocalKeys.set_rem_date_desc);
  String get forAWeek => translate(LocalKeys.for_a_week);
  String get forAMonth => translate(LocalKeys.for_a_month);
  String get time => translate(LocalKeys.time);
  String get exportAsPdf => translate(LocalKeys.export_as_pdf);
  String get export => translate(LocalKeys.export);
  String get transactionReport => translate(LocalKeys.transaction_report);
  String get monthlyReport => translate(LocalKeys.monthly_report);
  String get date => translate(LocalKeys.date);
  String get remark => translate(LocalKeys.remark);
  String get marketingSpeech => translate(LocalKeys.marketing_speech);
  String get marketingDesc => translate(LocalKeys.marketing_desc);
  String get sendMessage => translate(LocalKeys.send_message);
  String get addCustomerFromContacts => translate(LocalKeys.add_customer_from_contacts);
  String get contacts => translate(LocalKeys.contacts);
  String get customerName => translate(LocalKeys.customer_name);
  String get customerPhoneNo => translate(LocalKeys.customer_phone_no);
  String get customerList => translate(LocalKeys.customer_list);
  String get sendMessageAll => translate(LocalKeys.send_message_all);
  String get quickMessage => translate(LocalKeys.quick_message);
  String get quickMessageDesc => translate(LocalKeys.quick_message_desc);
  String get composeMessage => translate(LocalKeys.compose_message);
  String get composeMessageDesc => translate(LocalKeys.compose_message_desc);
  String get title => translate(LocalKeys.title);
  String get message => translate(LocalKeys.message);
  String get selectedCustomer => translate(LocalKeys.selected_customer);
  String get messageSent => translate(LocalKeys.message_sent);
  String get frequentlyContacted => translate(LocalKeys.frequently_contacted);
  String get profile => translate(LocalKeys.profile);
  String get buisnessCard => translate(LocalKeys.business_card);
  String get support => translate(LocalKeys.support);
  String get settings => translate(LocalKeys.settings);
  String get regPhoneNo => translate(LocalKeys.reg_phone_no);
  String get name => translate(LocalKeys.name);
  String get edit => translate(LocalKeys.edit);
  String get editPic => translate(LocalKeys.edit_pic);
  String get changePic => translate(LocalKeys.change_pic);
  String get download => translate(LocalKeys.download);
  String get saveAndShare => translate(LocalKeys.save_and_share);
  String get changeLanguage => translate(LocalKeys.change_language);
  String get changeCurrency => translate(LocalKeys.change_currency);
  String get appLock => translate(LocalKeys.app_lock);
  String get receiveNotifications => translate(LocalKeys.receive_notifications);
  String get receiveNewsletters => translate(LocalKeys.receive_newsletters);
  String get receiveSpecialOffers => translate(LocalKeys.receive_special_offers);
  String get receiveUpdates => translate(LocalKeys.receive_updates);
  String get selectYourLanguage => translate(LocalKeys.select_your_language);
  String get selectYourCurrency => translate(LocalKeys.select_your_currency);
  String get saved => translate(LocalKeys.saved);
  String get createANewPin => translate(LocalKeys.create_a_new_pin);
  String get confirmNewPin => translate(LocalKeys.confirm_new_pin);
  String get changeAppLockPin => translate(LocalKeys.change_app_lock_pin);
  String get removeAppLock => translate(LocalKeys.remove_app_lock);
  String get enterPin => translate(LocalKeys.enter_pin);
  String get pinRemoved => translate(LocalKeys.pin_removed);

}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return supportedLocalCodes.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class FallbackCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return supportedLocalCodes.contains(locale.languageCode);
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return DefaultCupertinoLocalizations.load(locale);
  }

  @override
  bool shouldReload(FallbackCupertinoLocalizationsDelegate old) => false;
}