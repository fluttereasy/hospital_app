class RequestPage {
  static String page(
      String? txn_details,
      String? pg_details,
      String? card_details,
      String? customer_details,
      String? billing_details,
      String? shipping_details,
      String? item_details,
      String? other_details,

      String? me_id,
      String? baseUrl)
  /*({required String txn_details,
      required String pg_details,
      required String card_details,
      required String customer_details,
  required String billing_details,
  required String shipping_details,
      required String item_details,
      required String other_details,
      required String upi_details,
  required String me_id,
  required String baseUrl})*/
       {
      String page = "<!--Process transaction-->" +
          "<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>" +
          "<html>" +
          "<head>" +
          "<meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1'>" +
          "<title>Payment Gateway</title>" +
          "</head>" +
          "<body OnLoad='OnLoadEvent();'>" +
          "<form name='RedirectForm' action='$baseUrl/agcore/payment' method='post'>" +
          "<input type='hidden' id='pg_details' name='pg_details' value='$pg_details' />" +
          "<input type='hidden' id='other_details' name='other_details' value='$other_details' />" +
          "<input type='hidden' id='me_id' name='me_id' value='$me_id' />" +
          "<input type='hidden' id='txn_details' name='txn_details' value='$txn_details' />" +
          "<input type='hidden' id='card_details' name='card_details' value='$card_details' />" +
          "<input type='hidden' id='cust_details' name='cust_details' value='$customer_details' />" +
          "<input type='hidden' id='bill_details' name='bill_details' value='$billing_details' />" +
          "<input type='hidden' id='ship_details' name='ship_details' value='$shipping_details' />" +
          "<input type='hidden' id='item_details' name='item_details' value='$item_details' />" +
         // "<input type='hidden' id='upi_details' name='upi_details' value='$upi_details' />" +
          "</form>" +
          "<script language='JavaScript'>" +
          "function OnLoadEvent() {document.RedirectForm.submit();}" +
          "</script>" +
          "</body>" +
          "</html>";
      return page;
  }

  static String checksumPage(
      String? merchantRequest,
      String? hash,
      String? me_id,
      String? baseUrl)

  {
    String page = "<!--Process transaction-->" +
        "<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>" +
        "<html>" +
        "<head>" +
        "<meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1'>" +
        "<title>Payment Gateway</title>" +
        "</head>" +
        "<body OnLoad='OnLoadEvent();'>" +
        "<form name='RedirectForm' action='$baseUrl/agcore/paymentProcessing' method='post'>" +
        "<input type='hidden' id='merchant_request' name='merchant_request' value='$merchantRequest' />" +
        "<input type='hidden' id='hash' name='hash' value='$hash' />" +
        "<input type='hidden' id='me_id' name='me_id' value='$me_id' />" +
        "</form>" +
        "<script language='JavaScript'>" +
        "function OnLoadEvent() {document.RedirectForm.submit();}" +
        "</script>" +
        "</body>" +
        "</html>";
    return page;
  }
}
