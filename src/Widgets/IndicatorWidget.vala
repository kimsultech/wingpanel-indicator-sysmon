/*-
 * Copyright (c) 2020 Tudor Plugaru (https://github.com/PlugaruT/wingpanel-monitor)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
 *
 * Authored by: Tudor Plugaru <plugaru.tudor@gmail.com>
 */

namespace WingpanelSystemMonitor {
    public class IndicatorWidget : Gtk.Box {
        private Gtk.Label label;
        private Gtk.Label title_label;
        private Gtk.Revealer widget_revealer;

        public string icon_name { get; construct; }
        public int char_width { get; construct; }
        public string title { get; construct; }
        public bool default_style { get; construct; }

        public string label_value {
            set {label.label = value; }
        }

        public string usage_value {
            set {
                if (int.parse(value) >= 80) {
                    label.get_style_context ().add_class ("high");
                } else if (int.parse(value) >= 50) {
                    label.get_style_context ().add_class ("medium");
                } else {
                    label.get_style_context ().remove_class ("high");
                    label.get_style_context ().remove_class ("medium");
                }
            }
        }

        public bool display {
            set { widget_revealer.reveal_child = value; }
            get { return widget_revealer.get_reveal_child () ; }
        }

        public IndicatorWidget (string icon_name, int char_width, string title, bool default_style) {
            Object (
                orientation: Gtk.Orientation.HORIZONTAL,
                icon_name: icon_name,
                char_width: char_width,
                title: title,
                default_style: default_style
            );
        }

        construct {
            var icon = new Gtk.Image.from_icon_name (icon_name, Gtk.IconSize.SMALL_TOOLBAR);

            if (title == "ICON_ONLY" || default_style) {
                var group = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);

                label = new Gtk.Label (_("N/A"));
                label.set_width_chars (char_width);

                group.pack_start (icon);
                group.pack_start (label);

                widget_revealer = new Gtk.Revealer ();
                widget_revealer.transition_type = Gtk.RevealerTransitionType.SLIDE_RIGHT;
                widget_revealer.reveal_child = true;

                widget_revealer.add (group);
            } else {
                var group = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);

                title_label = new Gtk.Label (_("N/A"));
                title_label.set_text(title);
                title_label.set_width_chars (6);
                title_label.get_style_context().add_class("title-label");
                title_label.set_xalign (0);

                label = new Gtk.Label (_("N/A"));
                label.set_width_chars (char_width + 1);
                label.get_style_context().add_class("label-usage");
                label.set_xalign (0);

                if (title == "WS" || title == "WORK") {
                    var icon_ws = new Gtk.Image.from_icon_name (icon_name, Gtk.IconSize.SMALL_TOOLBAR);
                    icon_ws.set_pixel_size (12);
                    var group_ws = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 4);
                    group_ws.pack_start (icon_ws);
                    group_ws.pack_start (label);
                    group.pack_start (title_label);
                    group.pack_start (group_ws);
                } else {
                    group.pack_start (title_label, false, false, 0);
                    group.pack_start (label, false, false, 0);
                }

                widget_revealer = new Gtk.Revealer ();
                widget_revealer.transition_type = Gtk.RevealerTransitionType.SLIDE_DOWN;
                widget_revealer.reveal_child = true;

                widget_revealer.add (group);
            }

            pack_start (widget_revealer);
        }
    }
}
