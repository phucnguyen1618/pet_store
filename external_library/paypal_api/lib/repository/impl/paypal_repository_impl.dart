import 'package:paypal_api/datasource/api_client.dart';
import 'package:paypal_api/models/models.dart';
import 'package:paypal_api/repository/paypal_repository.dart';
import 'package:paypal_api/request/invoice_request.dart';
import 'package:paypal_api/request/record_payment_request.dart';
import 'package:paypal_api/request/send_invoice_request.dart';
import 'package:paypal_api/response/generate_invoice_number_response.dart';
import 'package:paypal_api/response/invoice_response.dart';
import 'package:paypal_api/response/list_invoice_response.dart';
import 'package:paypal_api/response/record_invoice_payment_response.dart';

import '../../constants/app_constants.dart';

class PaypalRepositoryImpl extends PaypalRepository {
  final ApiClient _apiClient;

  PaypalRepositoryImpl(this._apiClient);

  @override
  Future<Authentication> authorize(
      {required String authorization,
      String? contentType = AppConstants.contentType,
      String? grantType = AppConstants.grantType}) {
    return _apiClient.authorize(
      authorization: authorization,
      grantType: grantType,
      contentType: contentType,
    );
  }

  @override
  Future<InvoiceResponse> createInvoice(
      {required InvoiceRequest request, String? token}) {
    return _apiClient.createInvoice(invoiceRequest: request, token: token);
  }

  @override
  Future<GenerateInvoiceNumberResponse> createInvoiceNumber({String? token}) {
    return _apiClient.createInvoiceNumber(token: token);
  }

  @override
  Future<InvoiceDetail> getInvoiceDetail(
      {required String invoiceId, String? token}) {
    return _apiClient.getInvoiceDetail(invoiceId: invoiceId, token: token);
  }

  @override
  Future<ListInvoiceResponse> getInvoices(
      {int? page, int? pageSize, bool? isRequired, String? token}) {
    return _apiClient.getListInvoice(
        page: page, pageSize: pageSize, token: token);
  }

  @override
  Future<RecordInvoicePaymentResponse> recordPayment(
      {required String id,
      required RecordPaymentRequest request,
      String? token}) {
    return _apiClient.recordPayment(
        invoiceId: id, paymentRequest: request, token: token);
  }

  @override
  Future<Link> sendInvoice(
      {required String idInvoice,
      required SendInvoiceRequest request,
      String? token}) {
    return _apiClient.sendInvoice(
        invoiceId: idInvoice, request: request, token: token);
  }
}
