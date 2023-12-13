import 'package:paypal_api/models/models.dart';
import 'package:paypal_api/request/invoice_request.dart';
import 'package:paypal_api/request/record_payment_request.dart';
import 'package:paypal_api/request/send_invoice_request.dart';
import 'package:paypal_api/response/generate_invoice_number_response.dart';
import 'package:paypal_api/response/list_invoice_response.dart';
import 'package:paypal_api/response/record_invoice_payment_response.dart';
import '../constants/app_constants.dart';

import '../response/invoice_response.dart';

abstract class PaypalRepository {
  Future<Authentication> authorize(
      {required String authorization, String? contentType = AppConstants.contentType,
      String? grantType = AppConstants.grantType});

  Future<GenerateInvoiceNumberResponse> createInvoiceNumber({String? token});

  Future<InvoiceResponse> createInvoice(
      {required InvoiceRequest request, String? token});

  Future<Link> sendInvoice(
      {required String idInvoice,
      required SendInvoiceRequest request,
      String? token});

  Future<InvoiceDetail> getInvoiceDetail(
      {required String invoiceId, String? token});

  Future<RecordInvoicePaymentResponse> recordPayment(
      {required String id,
      required RecordPaymentRequest request,
      String? token});

  Future<ListInvoiceResponse> getInvoices(
      {int? page, int? pageSize, bool? isRequired, String? token});
}
