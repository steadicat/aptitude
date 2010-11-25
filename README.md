# Tamper

> So you can tamper with your preprocessed files all you want, and
> make sure it's all compressed down in the end.

Tamper allows you to develop using HAML, Compass/SASS, and
CoffeeScript without havining to worry about the pre-processing
and deployment.

Tamper is 2 things:

1. a development web server for sites consisting of mainly static
files

2. a script to ease deployment of static files so that they are
served in the most performant way

## A development web server for static files

Static sites nowadays are not built with HTML, CSS, and Javascript,
like grandma used to do it. These days, we have
[HAML](http://haml-lang.org/), [Compass](http://compass-style.org/),
and [CoffeeScript](http://coffeescript.org/). They are obviously
much more awesome, because they all use significant
whitespace. Except they have another thing in common: they need to
be pre-processed into something grandma's browser can understand.

Let me tell you, that's a PITA. Because running a command to compile
on each change is not an option. If grandma used to be able to make
a change and refresh, I want to be able to do it too.

The usual solution is to run a script that watches files for
changes, and compiles them on the fly. Except I'm way faster than
the script. By the time the script is done compiling, I've already
refreshed the browser 27 times and I'm wondering why my change had
no effect.

We need a better solution. And the solution is right here. That's
right, it's a development web server. Like the one Django has. But
for static files.

## A script for high-performance deployments

With the help of Compass and CoffeeScript, Tamper conflates all
your CSS and Javascript into two files, `master.css` and
`master.js`, and it minifies them. Optionally, it also gzips them
and uploads them to S3 so you can serve them using Cloudfront. As
it uploads the files, it also updates all the references within
the files to point to the latest version on Cloudfront.

## Set up

### Prerequisites

The development server runs on [Node.js](http://nodejs.org/), so
you're gonna need to install that first.

[HAML](http://haml-lang.com/), [SASS](http://sass-lang.com/), and
[Compass](http://compass-style.org) are Ruby modules. You can
install them all like this:

    gem install compass

If you want to write your scripts in
[CoffeeScript](http://coffeescript.org/), install
[Npm](http://npmjs.org/), then:

    npm install coffee-script

Finally, if you want good support for [Markdown](http://daringfireball.net/projects/markdown/) in your HAML files, you should also install [Maruku](http://maruku.rubyforge.org/):

    gem install maruku

### Start development

Run:

    node develop.js

Then visit [http://localhost:5678/](http://localhost:5678/). If you
did everything right you should see a simple static web site.

## Deployment

_Watch this space for help on how to compile and compress all the
static files for deployment and (optionally) upload them to
CloudFront._

## Docs

Read the beautiful Docco [docs for the development web server](docs/develop.html).
