# HOW TO BUILD LOCALLY #

## WINDOWS ##

Open a terminal (on Windows, every command should be executed from the **git bash**) inside this directory (**not** the repository root).

* Download ruby from [here](https://rubyinstaller.org/downloads/)
* Install bundler: **gem install bundler**
* Install jekyll: **gem install jekyll**
* Create Gemfile: 
    * **echo "source 'https://rubygems.org'" > Gemfile**
    * **echo "gem 'github-pages', group: :jekyll_plugins" >> Gemfile**
* Install gems: **bundle install**
    * If some gem fails to install, use this: **gem install gem_name -v 'version' --source 'https://rubygems.org/'**
* Create site: **bundle exec jekyll \_3.3.0\_ new . --force**
    * Revert all changes made to *_config.yml* and *index.md* and other staged files
	* Make sure that the github-pages gem is still present in the gemfile
		* **echo "gem 'github-pages', group: :jekyll_plugins" >> Gemfile**
		* **bundle install**
* Execute Jekyll: **bundle exec jekyll serve**
    * If the port is in use, add **--port port_number**

### PROXY ###

The following should work for every command:

* export http_proxy=http://user:password@host:port
* export HTTP_PROXY=$http_proxy
* export https_proxy=http://user:password@host:port
* export HTTPS_PROXY=$https_proxy

Besides, the **gem install** command has another parameter: --http-proxy http://user:password@host:port

## REFERENCE ##

This [guide](https://help.github.jp/enterprise/2.11/user/articles/setting-up-your-github-pages-site-locally-with-jekyll/)
[Mac guide](https://jekyllrb.com/docs/installation/macos/)
