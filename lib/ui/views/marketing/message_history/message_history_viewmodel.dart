import 'package:flutter/material.dart';
import 'package:mycustomers/app/locator.dart';
import 'package:mycustomers/core/models/customer.dart';
import 'package:mycustomers/core/models/hive/customer_contacts/customer_contact_h.dart';
import 'package:mycustomers/core/models/hive/market_message/message_h.dart';
import 'package:mycustomers/core/services/customer_contact_service.dart';
import 'package:mycustomers/core/services/message_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MessageHistoryViewModel extends BaseViewModel {
  final _customerService = locator<CustomerContactService>();
  final _messageService = locator<MessageService>();
  final NavigationService _navigationService = locator<NavigationService>();
  Customer currentCustomer;
  TextEditingController messageController =TextEditingController();
  List<String> dummyQuickText= ['Don\'t leave me', 'Happy New Year', ' Season\'s greeting', 'Happy weekend'];
  List<String> dummyQuickTextMessages = [
    'Don\'t leave meHappy New YearSeason\'s greeting Happy weekend'
        'Don\'t leave meHappy New YearSeason\'s greeting Happy weekend',
    'Don\'t leave meHappy New YearSeason\'s greeting Happy weekend',
    'Don\'t leave meHappy New YearSeason\'s greeting Happy weekend',
    'Don\'t leave meHappy New YearSeason\'s greeting Happy weekend',
    'Don\'t leave meHappy New YearSeason\'s greeting Happy weekend',
    'Don\'t leave meHappy New YearSeason\'s greeting Happy weekend',
    'Don\'t leave meHappy New YearSeason\'s greeting Happy weekend',
  ];

  CustomerContact get customer => _customerService.contact;
  List<Message> get messages => _messageService.getMessage(customer.id);

  String mesgg;

  popView() {
    _navigationService.back();
  }

  void setContact() {
    CustomerContact cus = new CustomerContact(id: currentCustomer.id, name: currentCustomer.displayName, phoneNumber: currentCustomer.phone, initials: currentCustomer.initials);
    _customerService.setContact(cus);
  }

  init(customer){
    currentCustomer =customer;
    notifyListeners();
  }

  setText(value){
    messageController.text= value;
    notifyListeners();
  }

  void updatetext(value) {
    mesgg = value;
    notifyListeners();
  }

  void send() {
    _messageService.addMessage(mesgg, customer.id);
    messageController.clear();
    notifyListeners();
  }

}