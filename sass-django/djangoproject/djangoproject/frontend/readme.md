# Table of contents

1. [requirements for frontend](#requirements-for-frontend)
1. [installation](#installation)
1. [build frontend](#build-frontend)
1. [documentation](#documentation)

# requirements for frontend


## node.js

```
http://www.joyent.com/blog/installing-node-and-npm
```

## grunt

```
npm install -g grunt
npm install -g grunt-cli
```

## bower

```
npm install -g bower
```

## compass version 0.12.2

```
sudo gem install compass
```

## sass version 3.3.0alpha.141 for sourcemap support

```
sudo gem install sass -v 3.3.0.alpha.141 --pre
```

# installation

```
npm install
bower install
```


# build frontend

```
grunt
```

## to build with livereload:

```
grunt server
```

## to enable livereload install and  enable browser extension 

```
	http://feedback.livereload.com/knowledgebase/articles/86242-how-do-i-install-and-use-the-browser-extensions-
```

## Usage 

content of ``assets`` folder will be moved to the static directory without any changes


# documentation

generate frontend documentation in ``/frontend`` run

```
grunt docs
```

documentation links ``/frontend-docs/docs/index.html``

markup templates ``/markup/index.html``

