FROM ubuntu:16.04
MAINTAINER Jose María Hidalgo Garcia <jhidalgo3@gmail.com>

RUN apt-get update && apt-get install -y software-properties-common curl lib32stdc++6 lib32z1 && add-apt-repository -y ppa:webupd8team/java && apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer && apt-get clean && rm -rf /var/lib/apt/lists/*


# Install android SDK, tools and platforms
RUN cd /opt && curl https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz -o android-sdk.tgz && tar xzf android-sdk.tgz && rm android-sdk.tgz
ENV ANDROID_HOME /opt/android-sdk-linux
RUN echo 'y' | /opt/android-sdk-linux/tools/android update sdk -u -a -t platform-tools,build-tools-23.0.2,android-23

# Setup environment
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
ENV PATH ${PATH}:/opt/tools

WORKDIR /opt/workspace
