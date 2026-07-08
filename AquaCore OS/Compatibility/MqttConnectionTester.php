<?php

declare(strict_types=1);

namespace AquaCoreOS\Compatibility;

use AquaCoreOS\Config\MqttConfig;

final class MqttConnectionTester
{
    public function __construct(
        private readonly MqttConfig $configuration,
    ) {
    }

    public function test(): MqttTestResult
    {
        if (!$this->configuration->configured()) {
            return MqttTestResult::skipped('MQTT broker connection is not configured.');
        }

        if (!function_exists('stream_socket_client')) {
            return MqttTestResult::failure('client_missing', 'PHP stream socket client is not available.');
        }

        $host = trim($this->configuration->host());
        if ($host === '' || preg_match('/\s/', $host) === 1) {
            return MqttTestResult::failure('invalid_host', 'MQTT host is invalid.');
        }

        $port = $this->configuration->port();
        if ($port < 1 || $port > 65535) {
            return MqttTestResult::failure('invalid_port', 'MQTT port is invalid.');
        }

        $errorCode = 0;
        $errorMessage = '';
        $socket = @stream_socket_client(
            sprintf('tcp://%s:%d', $host, $port),
            $errorCode,
            $errorMessage,
            5,
        );

        if (!is_resource($socket)) {
            return MqttTestResult::failure(
                $this->diagnosticCode($errorCode, $errorMessage),
                'MQTT broker connection failed.',
            );
        }

        stream_set_timeout($socket, 5);

        try {
            $connectPacket = $this->connectPacket($this->configuration->clientId());
            if (fwrite($socket, $connectPacket) !== strlen($connectPacket)) {
                return MqttTestResult::failure('broker_unavailable', 'MQTT CONNECT packet could not be sent.');
            }

            $response = fread($socket, 4);
            if ($response === false || strlen($response) < 4) {
                return MqttTestResult::failure('timeout', 'MQTT broker did not return CONNACK in time.');
            }

            $bytes = array_values(unpack('C*', $response));
            if ($bytes[0] !== 0x20 || $bytes[1] !== 0x02) {
                return MqttTestResult::failure('protocol_error', 'MQTT broker returned an invalid CONNACK packet.');
            }

            if ($bytes[3] !== 0x00) {
                return MqttTestResult::failure($this->connackDiagnosticCode($bytes[3]), 'MQTT broker rejected CONNECT.');
            }

            fwrite($socket, "\xE0\x00");
        } finally {
            fclose($socket);
        }

        return MqttTestResult::success('MQTT broker connection successful.');
    }

    private function connectPacket(string $clientId): string
    {
        $clientId = $clientId !== '' ? $clientId : 'aquacore-os-diagnostic';
        $variableHeader = "\x00\x04MQTT\x04\x02\x00\x05";
        $payload = pack('n', strlen($clientId)) . $clientId;
        $remainingLength = strlen($variableHeader) + strlen($payload);

        return "\x10" . $this->encodeRemainingLength($remainingLength) . $variableHeader . $payload;
    }

    private function encodeRemainingLength(int $length): string
    {
        $encoded = '';

        do {
            $digit = $length % 128;
            $length = intdiv($length, 128);

            if ($length > 0) {
                $digit |= 128;
            }

            $encoded .= chr($digit);
        } while ($length > 0);

        return $encoded;
    }

    private function diagnosticCode(int $errorCode, string $errorMessage): string
    {
        $message = strtolower($errorMessage);

        if (str_contains($message, 'getaddrinfo') || str_contains($message, 'name or service not known')) {
            return 'host_not_found';
        }

        if (str_contains($message, 'refused')) {
            return 'connection_refused';
        }

        if (str_contains($message, 'timed out') || str_contains($message, 'timeout')) {
            return 'timeout';
        }

        if (str_contains($message, 'ssl') || str_contains($message, 'tls')) {
            return 'tls_error';
        }

        if ($errorCode !== 0) {
            return 'broker_unavailable';
        }

        return 'unknown_error';
    }

    private function connackDiagnosticCode(int $returnCode): string
    {
        return match ($returnCode) {
            0x04, 0x05 => 'authentication_failed',
            0x01 => 'protocol_error',
            0x02 => 'client_missing',
            0x03 => 'broker_unavailable',
            default => 'unknown_error',
        };
    }
}