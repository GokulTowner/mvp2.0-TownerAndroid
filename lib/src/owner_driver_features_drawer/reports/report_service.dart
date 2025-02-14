import '../../../imports.dart';

class ReportsService {
  Map<String, dynamic> reports = {
    "reports": {
      "Total Trips": [
        {"label": "Offline Booking", "value": 70, "color": "#457b9d"},
        {"label": "Online Booking", "value": 30, "color": "#a8dadc"}
      ],
      "Total Cancelled trips": [
        {"label": "Customer Cancel", "value": 10, "color": "#b5838d"},
        {"label": "Driver Cancel", "value": 5, "color": "#6d6875"}
      ],
      "Total Scheduled trips": [
        {"label": "Daily", "value": 20, "color": "#14213d"},
        {"label": "Outstation", "value": 15, "color": "#fca311"},
        {"label": "Rental", "value": 17, "color": "#e5e5e5"}
      ],
      "Total Kms travelled": [
        {"label": "Daily", "value": 150, "color": "#f5cac3"},
        {"label": "Outstation", "value": 450, "color": "#84a59d"},
        {"label": "Rental", "value": 633, "color": "#f28482"}
      ],
      "Total trip Amount": [
        {"label": "Offline Booking", "value": 15000, "color": "#3a5a40"},
        {"label": "Online Booking", "value": 5000, "color": "#a3b18a"}
      ],
      "Total Facial verifications": [
        {"label": "Verified", "value": 200, "color": "#ee6c4d"},
        {"label": "Rejected", "value": 50, "color": "#3d5a80"}
      ],
      "Total Driver Earned": [
        {"label": "Daily", "value": 600, "color": "#335c67"},
        {"label": "Outstation", "value": 740, "color": "#fff3b0"},
        {"label": "Rental", "value": 5080, "color": "#e09f3e"}
      ],
      "Total Days with Towner": [
        {"label": "Onduty", "value": 30, "color": "#ffd60a"},
        {"label": "Offduty", "value": 15, "color": "#7209b7"}
      ],
      "Total Wallet Added amount": [
        {"label": "Bank", "value": 1000, "color": "#8a817c"},
        {"label": "Other", "value": 2000, "color": "#463f3a"}
      ],
      "Total Coupons Claimed": [
        {"label": "Bank", "value": 50, "color": "#a98467"},
        {"label": "Other", "value": 50, "color": "#adc178"}
      ],
      "Total Wallet bonus received": [
        {"label": "Welcome Bonus", "value": 30, "color": "#264653"},
        {"label": "Referral Bonus", "value": 60, "color": "#2a9d8f"},
        {"label": "Coupon Bonus", "value": 10, "color": "#2E8B57"},
        {"label": "Subscription Bonus", "value": 25, "color": "#f4a261"},
        {"label": "Wallet Bonus", "value": 32, "color": "#e76f51"},
        {"label": "Performance Bonus", "value": 50, "color": "#457b9d"}
      ],
      "Total Subscription": [
        {"label": "Bank", "value": 100, "color": "#1b263b"},
        {"label": "Wallet", "value": 50, "color": "#415a77"},
        {"label": "Towner Coin", "value": 50, "color": "#778da9"}
      ],
      "Total Ratings": [
        {"label": "Customer Rated", "value": 150, "color": "#555b6e"},
        {"label": "Driver Rated", "value": 50, "color": "#89b0ae"}
      ],
      "Total Top Ratings": [
        {"label": "Top Ratings", "value": 10, "color": "#415a77"},
        {"label": "Low Ratings", "value": 20, "color": "#778da9"}
      ],
      "Total Referral Bonus": [
        {"label": "Claimed", "value": 50, "color": "#463f3a"},
        {"label": "Pending", "value": 20, "color": "#8a817c"},
        {"label": "Expired", "value": 25, "color": "#bcb8b1"}
      ],
      "Total Tickets Raised": [
        {"label": "Ticket Resolved", "value": 20, "color": "#6d597a"},
        {"label": "Ticket Active", "value": 20, "color": "#eaac8b"}
      ],
      "Discounts given": [
        {"label": "Distributor", "value": 50, "color": "#354f52"},
        {"label": "Promotion Offer", "value": 50, "color": "#84a98c"}
      ],
      "Total working hours": [
        {"label": "Offline", "value": 200, "color": "#4a4e69"},
        {"label": "Online", "value": 50, "color": "#c9ada7"}
      ],
      "Total Password reset": [
        {"label": "Successfull", "value": 21, "color": "#f2cc8f"},
        {"label": "Failed", "value": 4, "color": "#e07a5f"}
      ],
      "Total expense": [
        {"label": "Own", "value": 100, "color": "#fca311"},
        {"label": "Vehicle", "value": 4000, "color": "#000000"}
      ],
      "Total Profile registered": [
        {"label": "Vehicle", "value": 50, "color": "#dda15e"},
        {"label": "Driver", "value": 30, "color": "#bc6c25"}
      ],
      "Total wallet Transaction": [
        {"label": "Wallet Payments Received", "value": 100, "color": "#e9c46a"},
        {"label": "Wallet Payments Sent", "value": 50, "color": "#e76f51"}
      ]
    }
  };

  Dio dio = Dio();
  Future<ReportDataModel?> fetchReport() async {
    // String reportUrl = "";

    try {
      // final response = await dio.get(reportUrl);
      int statusCode = 200;
      if (statusCode == 200) {
        final Map<String, dynamic> data = reports;
        return ReportDataModel.fromJson(data);
      } else {
        throw Exception('Failed to load report data');
      }
    } catch (e) {
      throw Exception('Error fetching report data: $e');
    }
  }
}
