#!/bin/sh
trap "true" INT
touch big 2>/dev/null && cat /dev/zero >big 2>/dev/null || true
