default: index.html

%.html: %.md reveal.js Makefile custom.css template.html
	pandoc -trevealjs -Vtheme=sky -Vtransition=none --template=template.html --css=custom.css --standalone -o$@ $<

# we don't really care about reveal.js/index.html, but this makes sure that the submodule is actually checked out
reveal.js: reveal.js/index.html
	git submodule init
	git submodule update --recursive

serve:
	python -mSimpleHTTPServer 8001

watch:
	while true; do make; sleep 1; done
