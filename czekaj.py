#!/usr/bin/python
from gi.repository import Gtk, GObject

class ProgressBarWindow(Gtk.Window):

    def __init__(okno):
        Gtk.Window.__init__(okno, title="NeteXt'73 - Please Wait")
        okno.set_default_size(450, 35)
        okno.set_border_width(10)
        okno.set_position(Gtk.WindowPosition.CENTER)
	okno.set_icon_from_file('/opt/NeteXt73/menu/NeteXt73.png')
        
        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        okno.add(vbox)
	
        okno.progressbar = Gtk.ProgressBar()
        vbox.pack_start(okno.progressbar, True, True, 0)

        okno.timeout_id = GObject.timeout_add(50, okno.on_timeout, None)

    def on_timeout(okno, user_data):
	text = "Work in progress - please wait!"
	okno.progressbar.set_text(text)
	okno.progressbar.set_show_text(text)
        okno.progressbar.pulse()
	return True

win = ProgressBarWindow()
win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()

