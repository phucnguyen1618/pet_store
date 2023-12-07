import 'package:paypal_api/models/models.dart';
import 'package:paypal_api/request/invoice_request.dart';
import 'package:paypal_api/request/record_payment_request.dart';
import 'package:paypal_api/request/send_invoice_request.dart';
import 'package:paypal_api/response/generate_invoice_number_response.dart';
import 'package:paypal_api/response/record_invoice_payment_response.dart';

import '../response/invoice_response.dart';

abstract class PaypalRepository {
  Future<Authentication> authorize(String authorization);

  Future<GenerateInvoiceNumberResponse> createInvoiceNumber();

  Future<InvoiceResponse> createInvoice(InvoiceRequest request);

  Future<Link> sendInvoice(
      String idInvoice, SendInvoiceRequest request);

  Future<Invoice> getInvoiceDetail(String requestUrl);

  Future<RecordInvoicePaymentResponse> recordPayment(
      String id, RecordPaymentRequest request);
}
