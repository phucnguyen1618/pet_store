import 'package:paypal_api/datasource/api_client.dart';
import 'package:paypal_api/models/models.dart';
import 'package:paypal_api/repository/paypal_repository.dart';
import 'package:paypal_api/request/invoice_request.dart';
import 'package:paypal_api/request/record_payment_request.dart';
import 'package:paypal_api/request/send_invoice_request.dart';
import 'package:paypal_api/response/generate_invoice_number_response.dart';
import 'package:paypal_api/response/invoice_response.dart';
import 'package:paypal_api/response/record_invoice_payment_response.dart';

class PaypalRepositoryImpl extends PaypalRepository {
  final ApiClient _apiClient;

  PaypalRepositoryImpl(this._apiClient);

  @override
  Future<InvoiceResponse> createInvoice(InvoiceRequest request) {
    return _apiClient.createInvoice(request);
  }

  @override
  Future<GenerateInvoiceNumberResponse> createInvoiceNumber() {
    return _apiClient.createInvoiceNumber();
  }

  @override
  Future<Link> sendInvoice(
      String idInvoice, SendInvoiceRequest request) {
    return _apiClient.sendInvoice(idInvoice, request);
  }

  @override
  Future<Authentication> authorize(String authorization) {
    return _apiClient.authorize(authorization: authorization);
  }

  @override
  Future<Invoice> getInvoiceDetail(String requestUrl) {
    return _apiClient.getInvoiceDetail(requestUrl);
  }

  @override
  Future<RecordInvoicePaymentResponse> recordPayment(
      String id, RecordPaymentRequest request) {
    return _apiClient.recordPayment(id, request);
  }
}
