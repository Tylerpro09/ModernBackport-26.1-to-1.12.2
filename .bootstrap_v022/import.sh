#!/usr/bin/env bash
set -euo pipefail
cat .bootstrap_v022/part00 .bootstrap_v022/part01 .bootstrap_v022/rest00 .bootstrap_v022/rest01 .bootstrap_v022/rest02 .bootstrap_v022/rest03 .bootstrap_v022/rest04 .bootstrap_v022/rest05 .bootstrap_v022/rest06 .bootstrap_v022/rest07 .bootstrap_v022/rest08 > /tmp/mb-v022.tar.xz.b64
[ "$(wc -c < /tmp/mb-v022.tar.xz.b64 | tr -d ' ')" = "197752" ]
base64 -d /tmp/mb-v022.tar.xz.b64 > /tmp/mb-v022.tar.xz
echo 'b59d872a8c95ef57d6201bbaf79ecd7e58533043612442306b03e5cf90794058  /tmp/mb-v022.tar.xz' | sha256sum -c -
rm -rf /tmp/mbv022 && mkdir /tmp/mbv022
tar -xJf /tmp/mb-v022.tar.xz -C /tmp/mbv022 --strip-components=1
find . -mindepth 1 -maxdepth 1 ! -name .git ! -name .bootstrap_v022 -exec rm -rf {} +
cp -a /tmp/mbv022/. .
rm -rf .bootstrap_v022
