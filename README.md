# Fisbook
College project

### Requisites
  - [Docker Toolbox](https://www.docker.com/products/docker-toolbox)

### Install

```sh
$ git clone https://github.com/SofiaChuquin/fisbook-web.git
$ cd fisbook-web
$ docker-compose build
$ docker-compose up
$ docker-compose run web rake db:create db:migrate
```

Go to your [localhost:3000](http://localhost:3000)
