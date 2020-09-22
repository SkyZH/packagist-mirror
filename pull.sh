#!/bin/bash
set -e
cd "${0%/*}"

cat <<EOF > .env

# Application name
APP_NAME='Packagist Mirror'

# Language
APP_COUNTRY_NAME='China'
APP_COUNTRY_CODE='cn'

# Folder used to save the files
PUBLIC_DIR=$LUG_path

# Sync interval(show in page)
SLEEP=$LUG_interval

# Maintainer information
MAINTAINER_MIRROR='SJTUG'
MAINTAINER_PROFILE='https://github.com/sjtug'
MAINTAINER_REPO='https://github.com/sjtug/packagist-mirror'
MAINTAINER_LICENSE='MIT License'

# Main mirror used to get providers
# Official - https://repo.packagist.org
# UK - https://repo-eu-uk-1.packagist.org
MAIN_MIRROR=https://repo.packagist.org

# Pattern to generate the package URIs.
# I.E. packages.drupal.org uses: URI_PATTERN='%s$%s.json'
URI_PATTERN='p/%s$%s.json'

# Timezone
TZ='Asia/Shanghai'

# Data mirror used to download repositories data
# Africa, South Africa - https://packagist.co.za
# Asia, China - https://pkg.phpcomposer.com [https://packagist.phpcomposer.com] (not fully compatible - too much broken packages)
# Asia, China - https://php.cnpkg.org/ (not fully compatible - too much broken packages)
# Asia, Indonesia - https://packagist.phpindonesia.id
# Asia, South Korea - https://packagist.kr/
# Asia, Japan - https://packagist.jp
# South America, Brazil - https://packagist.com.br
DATA_MIRROR=$LUG_upstream

# URI of your mirror
URL=packagist.com.br

# Since your mirror exists
SINCE="Q2'19"

# Max connections by mirror
MAX_CONNECTIONS=25

# Google Analytics
GOOGLE_ANALYTICS_ID=
EOF

php bin/mirror create
