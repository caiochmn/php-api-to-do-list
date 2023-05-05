# Imagem base
FROM php:7.4-apache
# Instala as dependências do Composer
RUN composer install
COPY ../php-api-to-do-list/ /var/www/html
RUN chown -R www-data:www-data /var/www
RUN chmod 775 -R /var/www/html/php-api-to-do-list
# Atualiza as informações de configuração do banco de dados no arquivo Database.php
RUN sed -i "s/db_name = 'api'/db_name = 'todolistls'/g; s/db_user = 'admin'/db_user = 'todolistuser'/g; s/db_password = 'admin'/db_password = 'nbJichnm7lU='/g" /var/www/html/php-api-to-do-list/src/Database/Database.php

EXPOSE 80

# Derivando da imagem oficial do MySQL
FROM mysql:5.7
# Adicionando os scripts SQL para serem executados na criação do banco
COPY ./db/ /docker-entrypoint-initdb.d/


# Inicia o Apache
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]