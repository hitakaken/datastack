package com.novbank.server;

import io.vertx.core.Vertx;

/**
 * Created by ken on 15-8-27.
 */
public class EmbeddedVertxServer {
    public static void main(String[] args) {
        // Create an HTTP server which simply returns "Hello World!" to each request.
        Vertx.vertx().createHttpServer().requestHandler(req -> req.response().end("Hello World!")).listen(8080);
    }
}
