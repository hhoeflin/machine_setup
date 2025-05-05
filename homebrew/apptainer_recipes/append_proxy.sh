#!/usr/bin/env bash
APPEND_FILE=$1

if [[ -n "HTTP_PROXY" ]]; then
    echo "HTTP_PROXY=${HTTP_PROXY}" >> "${APPEND_FILE}"
    echo "http_proxy=${HTTP_PROXY}" >> "${APPEND_FILE}"
fi
if [[ -n "HTTPS_PROXY" ]]; then
    echo "HTTPS_PROXY=${HTTP_PROXY}" >> "${APPEND_FILE}"
    echo "https_proxy=${HTTP_PROXY}" >> "${APPEND_FILE}"
fi
if [[ -n "FTP_PROXY" ]]; then
    echo "FTP_PROXY=${FTP_PROXY}" >> "${APPEND_FILE}"
    echo "ftp_proxy=${FTP_PROXY}" >> "${APPEND_FILE}"
fi
if [[ -n "NO_PROXY" ]]; then
    echo "NO_PROXY=${NO_PROXY}" >> "${APPEND_FILE}"
    echo "no_proxy=${NO_PROXY}" >> "${APPEND_FILE}"
fi
