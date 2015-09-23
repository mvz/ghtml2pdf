require 'gir_ffi-gtk3'

GirFFI.setup :WebKit2, '4.0'

Gtk.init

win = Gtk::OffscreenWindow.new
web_view = WebKit2::WebView.new
win.add(web_view)

page_setup = Gtk::PageSetup.new
paper_size = page_setup.get_paper_size
puts "Paper size: #{paper_size.get_display_name}"

print_settings = Gtk::PrintSettings.new

print_settings.set_number_up 1
print_settings.set_reverse false
print_settings.set_print_pages :all
print_settings.set 'output-uri', 'file:///home/matijs/Documents/output.pdf'
print_settings.set 'output-file-format', 'pdf'
print_settings.set_collate false
print_settings.set_n_copies 1
print_settings.set_printer 'Print to File'
print_settings.set_page_set :all
print_settings.set_scale 100.0

print_operation = WebKit2::PrintOperation.new(web_view)
print_operation.page_setup = page_setup
print_operation.print_settings = print_settings

web_view.signal_connect "load-changed" do |wv, event, user_data|
  case event
  when :started
    # print_operation.run_dialog nil
    #require 'pry'
    #binding.pry
  when :finished
    print_operation.print
    pb = win.get_pixbuf
    pb.savev("google.png", "png", nil, nil)
    puts web_view.get_title
    sleep 2
    Gtk.main_quit
  end
end

web_view.load_uri('http://www.matijs.net/')
win.show_all

Gtk.main
