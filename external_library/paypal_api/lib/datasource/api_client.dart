import 'dart:core';

import 'package:paypal_api/constants/app_constants.dart';
import 'package:paypal_api/models/models.dart';
import 'package:paypal_api/request/invoice_request.dart';
import 'package:paypal_api/request/record_payment_request.dart';
import 'package:paypal_api/request/send_invoice_request.dart';
import 'package:paypal_api/response/generate_invoice_number_response.dart';
import 'package:retrofit/http.dart';

import '../response/invoice_response.dart';
import 'package:dio/dio.dart';

import '../response/record_invoice_payment_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST('/v1/oauth2/token')
  Future<Authentication> authorize(
      {@Header('Authorization') required String authorization,
      @Header('Content-Type') String? contentType = AppConstants.contentType,
      @Body() String? grantType = AppConstants.grantType});

  @POST('/v2/invoicing/generate-next-invoice-number')
  Future<GenerateInvoiceNumberResponse> createInvoiceNumber();

  @POST('/v2/invoicing/invoices')
  Future<InvoiceResponse> createInvoice(@Body() InvoiceRequest invoiceRequest);

  @POST('/v2/invoicing/invoices/{invoice_id}/send')
  Future<Link> sendInvoice(
    @Path('invoice_id') String invoiceId,
    @Body() SendInvoiceRequest request,
  );

  @GET('{url}')
  Future<Invoice> getInvoiceDetail(@Path('url') String requestUrl);

  @POST('/v2/invoicing/invoices/{invoice_id}/payments')
  Future<RecordInvoicePaymentResponse> recordPayment(
    @Path('invoice_id') String invoiceId,
    @Body() RecordPaymentRequest paymentRequest,
  );
}
