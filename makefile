
SHELL=/usr/local/bin/fish
OUTPUT=resume.{html,pdf}
NOT_NVM_NODE='/usr/local/bin/node'

.PHONY: use_node
use_node: 
	if string match $(NOT_NVM_NODE) (which node); nvm use node; end

resume.pdf: use_node resume.json 
	resume export resume.pdf

resume.html: use_node resume.json
	resume export resume.html

.PHONY: upload
upload: use_node resume.json
	resume publish


.PHONY: clean
clean: 
	for file in $(OUTPUT); if test -e $$file; rm $$file; end; end