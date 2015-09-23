# GHtml2Pdf

Will (perhaps) be a HTML to PDF converter based on WebKit2GTK+, using GirFFI to
drive it from Ruby.

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
