# Imagem base
FROM ubuntu:22.04

ENV TZ=America/Sao_Paulo \
    DEBIAN_FRONTEND=noninteractive
    
# Instala as dependências do Composer
RUN apt-get update \
    && apt-get install -y apache2 \
    && apt-get install -y php \
    && apt-get install -y php-mysql \
    && apt-get install -y libapache2-mod-php php-mysql \
    && apt-get install -y git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN apt-get install -y apache2 php libapache2-mod-php php-mysql 

# Instala o PHP e o Composer
# RUN apt-get install php composer -y

# Instala o servidor MySQL
#RUN apt-get install mysql-client -y

#instala php-composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Instala as dependências do Composer
#RUN composer install
#clona o repositorio 
RUN git clone https://github.com/caiochmn/php-api-to-do-list.git /var/www/html/php-api-to-do-list
RUN chown -R www-data:www-data /var/www
RUN chmod 777 -R /var/www/html/php-api-to-do-list
#RUN sed -i "s/db_name = 'api'/db_name = 'todolistls'/g; s/db_user = 'admin'/db_user = 'todolistuser'/g; s/db_password = 'admin'/db_password = 'nbJichnm7lU='/g" /var/www/html/php-api-to-do-list/src/Database/Database.php

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]

