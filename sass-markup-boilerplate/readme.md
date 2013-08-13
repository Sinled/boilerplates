Requirements for compile static
---------------

compass version 0.12.2

	sudo gem install compass

sass version 3.3.0alpha.141

	gem install sass -v 3.3.0.alpha.141 --pre


compile styles
---------

in directory width compass.rb run:

	sass --compass --watch styles:css --style compressed

compile with source maps compressed (work in chrome 27)

	sass --compass --sourcemap  --watch styles:css --style compressed


force recompile with source maps (work in chrome 27)

	sass --compass --sourcemap --update --force styles:css 
