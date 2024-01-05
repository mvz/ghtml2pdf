# GHtml2Pdf

by Matijs van Zuijlen

## Description

This will (perhaps) be a HTML to PDF converter based on WebKit2GTK+, using
[GirFFI](https://github.com/mvz/gir_ffi) to drive it from Ruby.

## Why I'm making this

Wkhtmltopdf annoys me, because:

* It patches Qt, causing enourmous bloat in the binary
* It uses QtWebkit, which is a browser kit not used by any popular browser (not
  even Konquerer), so no-one really notices if its rendering breaks (and it
  does)
* Building it yourself from source requires several GB of disk space

## The plan

Create a clean Ruby implementation of a converter using WebKit to render the
HTML and Gtk+'s print functionality to render the PDF. A web view can be
rendered offline so no windows should appear. Ideally, we would not want to
need X11, but as a workaround I'll use xvfb-run as a wrapper.

## Status

This is by no means done yet. If you need something production-ready now, use
Wkhtmltopdf or something else! That said, I'd love for people to try this out
and provide feedback. Also see Contributing below.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ghtml2pdf'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install ghtml2pdf
```

You will also need to install WebKit2GTK+, the Gtk+ bindings for WebKit2,
and GObject Introspection. You should probably also install AT-Spi 2 to
avoid some annoying warning messages.

On Debian and Ubuntu, this can be accomplished by installing the packages
`libgirepository-1.0-1`, `gir1.2-gtk-3.0`, `gir1.2-webkit2-3.0` or
`gir1.2-webkit2-4.0`, and `at-spi2-core`. You may also need to install ...

## Usage

The intended usage will be something like:

```bash
ghtml2pdf input.html output.pdf
```

## Development

After checking out the repo, install dependencies as described under
'Installation', and run `bundle install`. Then, run `bundle exec rake spec` to
run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

All contributions are welcome, so please feel free to file tickets or send pull
requests!

If you want to send pull requests or patches, please try to follow these
instructions. If you get stuck, make a pull request anyway and I'll try to help
out.

* Make sure `rake spec` runs without reporting any failures.
* Add tests for your feature. Otherwise, I can't see if it works or if I
  break it later.
* Make sure latest master merges cleanly with your branch. Things might
  have moved around since you forked.
* Try not to include changes that are irrelevant to your feature in the
  same commit.

You can submit your tickets and pull requests at
[GHtml2Pdf's GitHub repository](https://github.com/mvz/ghtml2pdf).

## License

Copyright &copy; 2015&ndash;2024 [Matijs van Zuijlen](http://www.matijs.net)

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
