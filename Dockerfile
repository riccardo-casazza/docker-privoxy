FROM alpine
RUN apk add --no-cache privoxy
RUN sed -i "s|^listen-address.*|listen-address 0.0.0.0:8118|g" /etc/privoxy/config
EXPOSE 8118
ENTRYPOINT ["/usr/sbin/privoxy", "--no-daemon", "--user", "privoxy", "/etc/privoxy/config"] 
