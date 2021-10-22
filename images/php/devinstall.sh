echo "Installing xdebug..."
pecl install xdebug-2.9.2
echo "xdebug has been installed"

docker-php-ext-enable xdebug

echo "Add configurations xdebug to php.ini file..."
echo "xdebug.remote_host=localhost" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
echo "xdebug.remote_connect_back=off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.remote_log='/tmp/xdebug_log.log'" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.profiler_enable=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.profiler_enable_trigger=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.profiler_output_dir='/web/backend/xdebug'" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug configurations has been added"
