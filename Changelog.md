# Changelog

## 0.5.2 / 2025-04-19

* Support Ruby 3.1 through 3.4 ([#106] by [mvz])
* Bump `gir_ffi` and `gir_ffi-gtk` dependencies ([#109] by [mvz])

[#106]: https://github.com/mvz/ghtml2pdf/pull/106
[#109]: https://github.com/mvz/ghtml2pdf/pull/109

## 0.5.1 / 2024-01-05

* Support Ruby 3.0 through 3.3, dropping support for 2.6 and 2.7
  ([#83], [#90], and [#100] by [mvz])

[mvz]: https://github.com/mvz

[#83]: https://github.com/mvz/ghtml2pdf/pull/83
[#90]: https://github.com/mvz/ghtml2pdf/pull/90
[#100]: https://github.com/mvz/ghtml2pdf/pull/100

## 0.5.0 / 2022-04-10

* Set output file from input file if not provided
* Abort if input and output file names are identical
* Drop support for Ruby 2.5
* Add support for Ruby 3.1

## 0.4.0 / 2021-08-11

* Target Ruby 2.5 and up
* Update dependency on GirFFI-Gtk and GirFFI
* Stop using Headless; This gem now needs an active graphical session to run

## 0.3.1 / 2019-02-13

* Update dependency on GirFFI-Gtk

## 0.3.0 / 2017-03-25

* Update dependency on GirFFI-Gtk
* Target Ruby 2.3 and up

## 0.2.0 / 2016-02-06

* Set wider margins by default
* Allow setting all margins from the command line

## 0.1.1 / 2016-02-06

* Run headlessly using xvfb
* Set A4 paper size explicitely
* Update dependency on GirFFI-Gtk

## 0.1.0 / 2015-11-26

* Initial release.
