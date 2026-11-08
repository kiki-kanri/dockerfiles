<?php
/**
 * Plugin Name: Image System CA
 * Description: Use the container CA store for WordPress HTTP API requests.
 */

add_filter('http_request_args', static function (array $args): array {
    // Preserve explicitly selected custom trust stores and SSL verification policy.
    if (
        ($args['sslcertificates'] ?? '') ===
        ABSPATH . WPINC . '/certificates/ca-bundle.crt'
    ) {
        $args['sslcertificates'] = '/etc/ssl/certs/ca-certificates.crt';
    }

    return $args;
});
