# https://github.com/jk2K/gitlab-ci-android-with-ndk

FROM jk2k/gitlab-ci-android:latest
MAINTAINER jk2K <jk2K.com>

ENV VERSION_ANDROID_NDK "android-ndk-r12b"

ENV ANDROID_NDK_HOME "/sdk/${VERSION_ANDROID_NDK}"

RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends \
    build-essential \
    file \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://dl.google.com/android/repository/${VERSION_ANDROID_NDK}-linux-x86_64.zip /ndk.zip
RUN unzip /ndk.zip -d /sdk && \
    rm -v /ndk.zip
