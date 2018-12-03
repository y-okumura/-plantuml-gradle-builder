FROM gradle:alpine
MAINTAINER y-okumura <y-okumura@nichiwa-system.co.jp>

ENV LANG ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8
ENV GRADLE_OPTS -Dorg.gradle.daemon=false -Djava.awt.headless=true -DdefaultFontName=IPAexGothic -Xmx1G

USER root
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --update add --no-cache graphviz font-ipa@testing

USER gradle
RUN fc-cache -fv
ADD build.gradle /tmp/build.gradle
RUN gradle --no-daemon -b /tmp/build.gradle setup

CMD gradle --no-daemon --stacktrace
