Ошибка webpacker::manifest::missingentryerror
Пути исправления ошибки:
 1-Проверить то что установлен Yarn v1.22.19 и Node.js v16.16.0 LTS
 2-yarn add @rails/webpacker
 3-bundle exec rake webpacker:install
 4-bundle exec rails webpacker:compile
