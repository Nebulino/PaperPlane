import 'dart:convert';
import 'dart:io' as io;

import 'package:meta/meta.dart';
import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/telegram.dart';

/// It helps creating a Webhook bot.
/// TODO: implement webhook
class Webhook {
  String url;
  String secretPath;
  int port;
  int maxConnections;
  List<UpdateType> allowedUpdates;

  io.File certificate;
  io.File privateKey;
  bool toBeUploaded;

  Updater updater;

  final Telegram _telegram;

  io.HttpServer _httpServer;
  io.SecurityContext _securityContext;

  bool _webhook = false;
  bool _crosscheck = false;

  Webhook(this._telegram,
      {@required this.url,
      @required this.secretPath,
      @required this.certificate,
      @required this.privateKey,
      this.port = 433,
      this.toBeUploaded = false,
      this.maxConnections = Constant.MAX_WEBHOOK_CONNECTIONS,
      this.allowedUpdates,
      bool sync_updater}) {
    if (Constant.SUPPORT_WEBHOOK_PORTS.contains(port)) {
      throw PaperPlaneException(
          description: 'Port not supported.'
              ' Only [443, 80, 88, 8443] are supported.');
    }

    updater = Updater(sync_updater);

    _securityContext = io.SecurityContext();
    _securityContext.useCertificateChainBytes(certificate.readAsBytesSync());
    _securityContext.usePrivateKeyBytes(privateKey.readAsBytesSync());
  }

  bool get isWebhook => _webhook;

  /// Set the webhook.
  Future<void> setWebhook() async {
    final setServer = io.HttpServer.bindSecure(
            io.InternetAddress.anyIPv4, port, _securityContext)
        .then((io.HttpServer server) => _httpServer = server);

    await setServer.then((_) {
      final webhookUrl = '${url}:${port}${secretPath}';
      // TODO: better logger.
      print('Webhook created in ${webhookUrl} at ' +
          DateTime.now().toIso8601String());
      _telegram.methods.setWebhook(
          url: webhookUrl,
          certificate: certificate,
          maxConnections: maxConnections,
          allowedUpdates: allowedUpdates);
      _crosscheck = true;
    }).catchError((error) => Future.error(PaperPlaneException(
        description: 'Error in [Webhook]: ${error.toString()}')));
  }

  /// It starts the webhook.
  Future<void> start() async {
    if (_crosscheck) {
      _httpServer.listen((io.HttpRequest request) {
        if (request.method == 'POST') {
          print('Webhook triggered at ' + DateTime.now().toIso8601String());
          if (request.uri.path == secretPath) {
            request
                .cast<List<int>>()
                .transform(utf8.decoder)
                .join()
                .then((data) {
              updater.updateQueue(Update.fromJson(jsonDecode(data)));
              // Send a 'ok': true to say that all is fine.
              // TODO: Using shelf?
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
      }).onError((error) => Future.error(PaperPlaneException(
          description: 'Method not Allowed: ${error.toString()}')));
    } else {
      return Future.error(PaperPlaneException(
          description: 'No Initialized webhook.'
              'Use setWebhook() first.'));
    }
  }

  Future<void> deleteWebhook() async {
    await _telegram.methods.deleteWebhook().catchError((error) => Future.error(
        PaperPlaneException(
            description: "Can't delete webhook: ${error.toString()}")));
    _webhook = false;
    _crosscheck = false;
  }

  /// It stops the webhook.
  void stopServer() {
    if (_httpServer != null) {
      _httpServer.close();
    }
  }
}
