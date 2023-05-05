# PHP API TO-DO-LIST v.2.0

<code><img height="50" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/php/php.png"></code>
<code><img height="50" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/mysql/mysql.png"></code>

Esta API tem como objetivo apresentar um breve guia para consumir recursos de uma API, principalmente para estudantes nos primeiros anos de cursos de Ciência da Computação e similares. Por essa razão, possui poucos EndPoints para uso e pode ser expandida de acordo com a necessidade.

A API possui duas funcionalidades: "**USUÁRIO**" e "**TAREFA**". O objetivo é que um usuário possa registrar sua lista de tarefas, realizando manipulação básica de dados em ambos os recursos. Como um bônus, a API permite, após a criação do usuário, o envio de uma imagem para o perfil do usuário.

Como é um projeto instrucional, **não é recomendável** que seja aplicado em um ambiente de produção, pois rotinas de segurança e testes não foram implementados. Esses recursos devem ser pesquisados e implementados, seguindo as regras atuais, além das boas práticas. Construído em **PHP 7** (veja abaixo), permite que o iniciante entenda os mecanismos de acesso aos recursos de uma API.

```html
PHP 7.4.3 (cli) (built: Jul   5 2021 15:13:35) ( NTS )
Direitos autorais (c) The PHP Group Zend Engine v3.4.0, 
Direitos autorais (c) Zend Technologies with Zend OPcache v7.4.3, 
Direitos autorais (c), por Zend Technologies
```

## Como usar este conteúdo?

Este conteúdo possui _licença livre para uso_ (CC BY-SA 4.0).

Se você quiser colaborar neste repositório com quaisquer melhorias que tenha feito. Para isso, basta fazer um Fork e enviar Pull Requests.

## Composer

As alterações devem ser atualizadas via <code>composer dump-autoload -o</code> em sua máquina local.

## Documentação

Esta API fornece funcionalidade para criar e manter usuários para controlar um aplicativo simples de lista de tarefas. O seguinte mostra a estrutura da API para recursos de **usuários** e **tarefas**.

## Estrutura da API

```text
+---api
    \task\
        ---delete
        ---edit
        ---new
        ---search
        ---update
    \user\
        ---new
        ---login
        ---update
        ---updateuserpass
        ---delete
+---src
    \---Database
    \---Helpers
    \---Task
    \---User
\---vendor
    \---composer
```

## Banco de Dados

O desenvolvimento usa o MySQL 5, que pode ser alterado a qualquer momento de acordo com a necessidade de uso. O banco de dados deve ser configurado em <code>Database\Database.php</code>

### Scripts SQL

```sql
CREATE DATABASE nome;
```

```sql
CREATE