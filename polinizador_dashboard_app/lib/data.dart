import 'package:flutter/material.dart';

/// A data model for an account.
///
/// The [primaryAmount] is the balance of the account in USD.
class AccountData {
  const AccountData({this.name, this.primaryAmount, this.accountNumber});

  /// The display name of this entity.
  final String name;

  /// The primary amount or value of this entity.
  final double primaryAmount;

  /// The full displayable account number.
  final String accountNumber;
}

/// A data model for a bill.
///
/// The [primaryAmount] is the amount due in USD.
class BillData {
  const BillData({
    this.name,
    this.primaryAmount,
    this.dueDate,
    this.isPaid = false,
  });

  /// The display name of this entity.
  final String name;

  /// The primary amount or value of this entity.
  final double primaryAmount;

  /// The due date of this bill.
  final String dueDate;

  /// If this bill has been paid.
  final bool isPaid;
}

/// A data model for a budget.
///
/// The [primaryAmount] is the budget cap in USD.
class BudgetData {
  const BudgetData({this.name, this.primaryAmount, this.amountUsed});

  /// The display name of this entity.
  final String name;

  /// The primary amount or value of this entity.
  final double primaryAmount;

  /// Amount of the budget that is consumed or used.
  final double amountUsed;
}

/// A data model for an alert.
class AlertData {
  AlertData({this.message, this.iconData});

  /// The alert message to display.
  final String message;

  /// The icon to display with the alert.
  final IconData iconData;
}

class DetailedEventData {
  const DetailedEventData({
    this.title,
    this.date,
    this.amount,
  });

  final String title;
  final DateTime date;
  final double amount;
}

/// A data model for data displayed to the user.
class UserDetailData {
  UserDetailData({this.title, this.value});

  /// The display name of this entity.
  final String title;

  /// The value of this entity.
  final String value;
}

/// Class to return dummy data lists.
///
/// In a real app, this might be replaced with some asynchronous service.
class DummyDataService {
  static List<AccountData> getAccountDataList(BuildContext context) {
    return <AccountData>[
      AccountData(
        name:   "rallyAccountDataChecking",
        primaryAmount: 2215.13,
        accountNumber: '1234561234',
      ),
      AccountData(
        name:   "rallyAccountDataHomeSavings",
        primaryAmount: 8678.88,
        accountNumber: '8888885678',
      ),
      AccountData(
        name:   "rallyAccountDataCarSavings",
        primaryAmount: 987.48,
        accountNumber: '8888889012',
      ),
      AccountData(
        name:   "rallyAccountDataVacation",
        primaryAmount: 253,
        accountNumber: '1231233456',
      ),
    ];
  }

  // static List<UserDetailData> getAccountDetailList(BuildContext context) {
  //   return <UserDetailData>[
  //     UserDetailData(
  //       title:
  //           "rallyAccountDetailDataAnnualPercentageYield",
  //       value: "0.001",
  //     ),
  //     UserDetailData(
  //       title:
  //         "rallyAccountDetailDataInterestRate",
  //       value: "1676.14",
  //     ),
  //     UserDetailData(
  //       title:
  //         rallyAccountDetailDataInterestYtd,
  //       value: usdWithSignFormat(context).format(81.45),
  //     ),
  //     UserDetailData(
  //       title:
  //           .rallyAccountDetailDataInterestPaidLastYear,
  //       value: usdWithSignFormat(context).format(987.12),
  //     ),
  //     UserDetailData(
  //       title:
  //           .rallyAccountDetailDataNextStatement,
  //       value: shortDateFormat(context).format(DateTime.utc(2019, 12, 25)),
  //     ),
  //     UserDetailData(
  //       title:
  //         rallyAccountDetailDataAccountOwner,
  //       value: 'Philip Cao',
  //     ),
  //   ];
  // }

  static List<DetailedEventData> getDetailedEventItems() {
    // The following titles are not localized as they're product/brand names.
    return <DetailedEventData>[
      DetailedEventData(
        title: 'Genoe',
        date: DateTime.utc(2019, 1, 24),
        amount: -16.54,
      ),
      DetailedEventData(
        title: 'Fortnightly Subscribe',
        date: DateTime.utc(2019, 1, 5),
        amount: -12.54,
      ),
      DetailedEventData(
        title: 'Circle Cash',
        date: DateTime.utc(2019, 1, 5),
        amount: 365.65,
      ),
      DetailedEventData(
        title: 'Crane Hospitality',
        date: DateTime.utc(2019, 1, 4),
        amount: -705.13,
      ),
      DetailedEventData(
        title: 'ABC Payroll',
        date: DateTime.utc(2018, 12, 15),
        amount: 1141.43,
      ),
      DetailedEventData(
        title: 'Shrine',
        date: DateTime.utc(2018, 12, 15),
        amount: -88.88,
      ),
      DetailedEventData(
        title: 'Foodmates',
        date: DateTime.utc(2018, 12, 4),
        amount: -11.69,
      ),
    ];
  }

  // static List<BillData> getBillDataList(BuildContext context) {
  //   // The following names are not localized as they're product/brand names.
  //   return <BillData>[
  //     BillData(
  //       name: 'RedPay Credit',
  //       primaryAmount: 45.36,
  //       dueDate: dateFormatAbbreviatedMonthDay(context)
  //           .format(DateTime.utc(2019, 1, 29)),
  //     ),
  //     BillData(
  //       name: 'Rent',
  //       primaryAmount: 1200,
  //       dueDate: dateFormatAbbreviatedMonthDay(context)
  //           .format(DateTime.utc(2019, 2, 9)),
  //       isPaid: true,
  //     ),
  //     BillData(
  //       name: 'TabFine Credit',
  //       primaryAmount: 87.33,
  //       dueDate: dateFormatAbbreviatedMonthDay(context)
  //           .format(DateTime.utc(2019, 2, 22)),
  //     ),
  //     BillData(
  //       name: 'ABC Loans',
  //       primaryAmount: 400,
  //       dueDate: dateFormatAbbreviatedMonthDay(context)
  //           .format(DateTime.utc(2019, 2, 29)),
  //     ),
  //   ];
  // }

  // static List<UserDetailData> getBillDetailList(BuildContext context,
  //     {double dueTotal, double paidTotal}) {
  //   return <UserDetailData>[
  //     UserDetailData(
  //       title:   rallyBillDetailTotalAmount,
  //       value: usdWithSignFormat(context).format(paidTotal + dueTotal),
  //     ),
  //     UserDetailData(
  //       title:   rallyBillDetailAmountPaid,
  //       value: usdWithSignFormat(context).format(paidTotal),
  //     ),
  //     UserDetailData(
  //       title:   rallyBillDetailAmountDue,
  //       value: usdWithSignFormat(context).format(dueTotal),
  //     ),
  //   ];
  // }

  // static List<BudgetData> getBudgetDataList(BuildContext context) {
  //   return <BudgetData>[
  //     BudgetData(
  //       name:   rallyBudgetCategoryCoffeeShops,
  //       primaryAmount: 70,
  //       amountUsed: 45.49,
  //     ),
  //     BudgetData(
  //       name:   rallyBudgetCategoryGroceries,
  //       primaryAmount: 170,
  //       amountUsed: 16.45,
  //     ),
  //     BudgetData(
  //       name:   rallyBudgetCategoryRestaurants,
  //       primaryAmount: 170,
  //       amountUsed: 123.25,
  //     ),
  //     BudgetData(
  //       name:   rallyBudgetCategoryClothing,
  //       primaryAmount: 70,
  //       amountUsed: 19.45,
  //     ),
  //   ];
  // }

  // static List<UserDetailData> getBudgetDetailList(BuildContext context,
  //     {double capTotal, double usedTotal}) {
  //   return <UserDetailData>[
  //     UserDetailData(
  //       title:   rallyBudgetDetailTotalCap,
  //       value: usdWithSignFormat(context).format(capTotal),
  //     ),
  //     UserDetailData(
  //       title:   rallyBudgetDetailAmountUsed,
  //       value: usdWithSignFormat(context).format(usedTotal),
  //     ),
  //     UserDetailData(
  //       title:   rallyBudgetDetailAmountLeft,
  //       value: usdWithSignFormat(context).format(capTotal - usedTotal),
  //     ),
  //   ];
  // }

  // static List<String> getSettingsTitles(BuildContext context) {
  //   return <String>[
  //       rallySettingsManageAccounts,
  //       rallySettingsTaxDocuments,
  //       rallySettingsPasscodeAndTouchId,
  //       rallySettingsNotifications,
  //       rallySettingsPersonalInformation,
  //       rallySettingsPaperlessSettings,
  //       rallySettingsFindAtms,
  //       rallySettingsHelp,
  //       rallySettingsSignOut,
  //   ];
  // }

  static List<AlertData> getAlerts(BuildContext context) {
    return <AlertData>[
      AlertData(
        message: "Novo produto indexado!",
        iconData: Icons.sort,
      ),
      AlertData(
        message: "Novo cliente cadastrado!",
        iconData: Icons.sort,
      ),
      AlertData(
        message: "Uma boa hora para promoção no produto 'AirFryer'",
        iconData: Icons.credit_card,
      ),
      AlertData(
        message: "O resumo do dia de ontem já está pronto!",
        iconData: Icons.attach_money,
      ),
      AlertData(
        message: "Algumas compras foram canceladas...",
        iconData: Icons.not_interested,
      ),
    ];
  }
}