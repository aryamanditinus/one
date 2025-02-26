#Pull the latest apache image
FROM httpd:latest

#Copy web server data
COPY web /usr/local/apache2/htdocs/

#Copy custom web server configuration file.
COPY web-server.conf /usr/local/apache2/conf/extra/web-server.conf

#Include the extra configuration file.
RUN echo "Include conf/extra/web-server.conf" >> /usr/local/apache2/conf/httpd.conf

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["httpd", "-D", "FOREGROUND"]
