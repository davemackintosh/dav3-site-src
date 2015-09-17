.PHONY : watch hugo deploy dependencies

watch:
	@make hugo &
	@make ./themes/dav3.co/static/css/theme.css

hugo:
	hugo server --baseUrl=http://localhost:1313 --theme=dav3.co --buildDrafts --watch

./themes/dav3.co/static/css/theme.css: themes/dav3.co/scss/main.scss
	scss --watch --sourcemap=inline $<:$@

deploy: ./deploy.sh
	$<

dependencies:
	gem install sass
	gem install neat
	gem install bourbon
	pushd themes/dav3.co/scss/; neat install; bourbon install; popd
	rvm fix-permissions
