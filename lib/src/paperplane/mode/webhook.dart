//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'dart:convert';
import 'dart:io' as io;

import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/telegram.dart';

/// It helps creating a Webhook bot.
class Webhook {
  String url;
  String secretPath;
  int port;
  int maxConnections;
  List<UpdateType>? allowedUpdates;

  io.File? certificate;
  io.File? privateKey;
  bool toBeUploaded;

  late final Updater updater;

  final Telegram _telegram;

  io.HttpServer? _httpServer;
  io.SecurityContext? _securityContext;

  bool _webhook = false;
  bool _crosscheck = false;

  Webhook(this._telegram,
      {required this.url,
      required this.secretPath,
      this.certificate,
      this.privateKey,
      this.port = 443,
      this.toBeUploaded = false,
      this.maxConnections = Constant.MAX_WEBHOOK_CONNECTIONS,
      this.allowedUpdates}) {
    if (!Constant.SUPPORT_WEBHOOK_PORTS.contains(port)) {
      throw PaperPlaneException(
          description: 'Port not supported.'
              ' Only [443, 80, 88, 8443] are supported.');
    }

    updater = Updater();

    if (certificate != null && privateKey != null) {
      _securityContext = io.SecurityContext();
      _securityContext!.useCertificateChainBytes(certificate!.readAsBytesSync());
      _securityContext!.usePrivateKeyBytes(privateKey!.readAsBytesSync());
    }
  }

  bool get isWebhook => _webhook;

  /// Set the webhook.
  Future<void> setWebhook() async {
    final Future<io.HttpServer> serverFuture;
    if (_securityContext != null) {
      serverFuture = io.HttpServer.bindSecure(
          io.InternetAddress.anyIPv4, port, _securityContext!);
    } else {
      serverFuture = io.HttpServer.bind(io.InternetAddress.anyIPv4, port);
    }

    try {
      _httpServer = await serverFuture;
      final webhookUrl = '$url:$port$secretPath';
      print('Webhook created in $webhookUrl at ${DateTime.now().toIso8601String()}');
      await _telegram.methods.setWebhook(
          url: webhookUrl,
          certificate: certificate,
          maxConnections: maxConnections,
          allowedUpdates: allowedUpdates);
      _crosscheck = true;
      _webhook = true;
    } catch (error) {
      throw PaperPlaneException(
          description: 'Error in [Webhook]: ${error.toString()}');
    }
  }

  /// It starts the webhook.
  Future<void> start() async {
    if (_crosscheck && _httpServer != null) {
      _httpServer!.listen((io.HttpRequest request) {
        if (request.method == 'POST') {
          print('Webhook triggered at ${DateTime.now().toIso8601String()}');
          if (request.uri.path == secretPath) {
            request
                .cast<List<int>>()
                .transform(utf8.decoder)
                .join()
                .then((data) {
              updater.updateQueue(Update.fromJson(jsonDecode(data)));
              request.response
                ..write(jsonEncode({'ok': true}))
                ..close();
            });
          } else {
            request.response
              ..statusCode = io.HttpStatus.methodNotAllowed
              ..write(jsonEncode({'ok': false}))
              ..close();
          }
        }
      }).onError((error) {
        print('Error in webhook listener: $error');
      });
    } else {
      throw PaperPlaneException(
          description: 'No Initialized webhook. Use setWebhook() first.');
    }
  }

  Future<void> deleteWebhook() async {
    try {
      await _telegram.methods.deleteWebhook();
    } catch (error) {
      throw PaperPlaneException(
          description: "Can't delete webhook: ${error.toString()}");
    }
    _webhook = false;
    _crosscheck = false;
  }

  /// It stops the webhook.
  void stopServer() {
    _httpServer?.close();
  }
}
