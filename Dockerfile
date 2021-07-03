# base image
FROM node:12

# set working directory
RUN mkdir /app
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies using yarn
ADD package.json yarn.lock /app/
RUN yarn --pure-lockfile

# Copy all frontend stuff to new "app" folder
COPY . /app/

RUN yarn build

EXPOSE 1234

CMD ["yarn", "serve", "-H", "0.0.0.0"]

