# Base our image on an official, minimal image of our preferred Ruby
FROM runmymind/docker-android-sdk:latest

# Install essential Linux packages
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends ruby ruby-dev ruby-build build-essential

# installing plugins
RUN gem install bundler rake
RUN gem install danger-gitlab

ENV WORK_DIR "/danger"
ENV DANGER_GITLAB_HOST "https://gitlab.quadiontech.com/"
ENV DANGER_GITLAB_API_BASE_URL "https://gitlab.quadiontech.com/api/v4/"

RUN danger --version

VOLUME ${WORK_DIR}
WORKDIR ${WORK_DIR}

ENTRYPOINT [""]
