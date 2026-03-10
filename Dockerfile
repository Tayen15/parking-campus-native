FROM php:8.2-apache

# Install required PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mods
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Configure PHP
RUN echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php.ini && \
    echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php.ini

# Expose port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
