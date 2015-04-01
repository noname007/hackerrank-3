all: clean compile test

clean:
	for dir in $$(ls -d functional-programming/*/*); do \
		rm -f $$dir/*.beam; done

compile:
	for dir in $$(ls -d functional-programming/*/*); do \
		erlc -o $$dir $$dir/*.erl; done

test:
	for dir in $$(ls -d functional-programming/*/*); do \
		erl -eval "c:cd(\"$$dir\"), eunit:test(tests,[verbose]), init:stop()." -noshell; \
		done

.PHONY: all
