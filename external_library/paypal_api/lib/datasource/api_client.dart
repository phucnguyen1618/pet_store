import 'dart:core';

import 'package:paypal_api/constants/app_constants.dart';
import 'package:paypal_api/models/models.dart';
import 'package:paypal_api/request/cancel_invoice_request.dart';
import 'package:paypal_api/request/invoice_request.dart';
import 'package:paypal_api/request/record_payment_request.dart';
import 'package:paypal_api/request/send_invoice_request.dart';
import 'package:paypal_api/response/generate_invoice_number_response.dart';
import 'package:paypal_api/response/list_invoice_response.dart';
import 'package:retrofit/http.dart';

import '../response/invoice_response.dart';
import 'package:dio/dio.dart';

import '../response/record_invoice_payment_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @FormUrlEncoded()
  @POST('/v1/oauth2/token')
  Future<Authentication> authorize(
      {@Header('Authorization') required String authorization,
      @Header('Content-Type') String? contentType = AppConstants.contentType,
      @Field('grant_type') String? grantType = AppConstants.grantType});

  @POST('/v2/invoicing/generate-next-invoice-number')
  Future<GenerateInvoiceNumberResponse> createInvoiceNumber(
      {@Header('Authorization') String? token});

  @POST('/v2/invoicing/invoices')
  Future<InvoiceResponse> createInvoice({
    @Body() required InvoiceRequest invoiceRequest,
    @Header('Authorization') String? token,
  });

  @POST('/v2/invoicing/invoices/{invoice_id}/send')
  Future<Link> sendInvoice({
    @Path('invoice_id') required String invoiceId,
    @Body() required SendInvoiceRequest request,
    @Header('Authorization') String? token,
  });

  @GET('/v2/invoicing/invoices/{invoice_id}')
  Future<InvoiceDetail> getInvoiceDetail({
    @Path() required String invoiceId,
    @Header('Authorization') String? token,
  });

  @POST('/v2/invoicing/invoices/{invoice_id}/payments')
  Future<RecordInvoicePaymentResponse> recordPayment({
    @Path('invoice_id') required String invoiceId,
    @Body() required RecordPaymentRequest paymentRequest,
    @Header('Authorization') String? token,
  });

  @GET('/v2/invoicing/invoices')
  Future<ListInvoiceResponse> getListInvoice({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Query('total_required') bool? required = true,
    @Header('Authorization') String? token,
  });

  @POST('/v2/invoicing/invoices/{invoice_id}/cancel')
  Future<void> cancelInvoice({
    @Path() required String idInvoice,
    @Body() required CancelInvoiceRequest request,
    @Header('Authorization') String? token,
  });
}
