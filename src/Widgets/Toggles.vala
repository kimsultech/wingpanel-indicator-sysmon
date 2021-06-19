/*-
 * Copyright (c) 2020 Tudor Plugaru (https://github.com/PlugaruT/wingpanel-monitor)
 * Copyright (c) 2021 Fernando Casas Schössow (https://github.com/casasfernando/wingpanel-indicator-sysmon)
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
 *              Fernando Casas Schössow <casasfernando@outlook.com>
 */

namespace WingpanelSystemMonitor {
    public class TogglesWidget : Gtk.Grid {
        private Gtk.Separator settings_separator;
        private Granite.SwitchModelButton cpu_switch;
        private Granite.SwitchModelButton cpu_temp_switch;
        private Granite.SwitchModelButton ram_switch;
        private Granite.SwitchModelButton network_switch;
        private Granite.SwitchModelButton disk_switch;
        private Granite.SwitchModelButton workspace_switch;
        private Granite.SwitchModelButton icon_only_switch;
        private Granite.SwitchModelButton indicator;
        public unowned Settings settings { get; construct set; }

        public TogglesWidget (Settings settings) {
            Object (settings: settings, hexpand: true);
        }

        construct {
            orientation = Gtk.Orientation.VERTICAL;
            row_spacing = 6;

            icon_only_switch = new Granite.SwitchModelButton ("Show indicator icon only");
            icon_only_switch.set_active (settings.get_boolean ("icon-only"));
            settings_separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);
            cpu_switch = new Granite.SwitchModelButton ("CPU usage");
            cpu_switch.set_active (settings.get_boolean ("show-cpu"));
            cpu_temp_switch = new Granite.SwitchModelButton ("CPU temperature");
            cpu_temp_switch.set_active (settings.get_boolean ("show-cpu-temp"));
            ram_switch = new Granite.SwitchModelButton ("RAM usage");
            ram_switch.set_active (settings.get_boolean ("show-ram"));
            network_switch = new Granite.SwitchModelButton ("Network usage");
            network_switch.set_active (settings.get_boolean ("show-network"));
            disk_switch = new Granite.SwitchModelButton ("Disk usage");
            disk_switch.set_active (settings.get_boolean ("show-disk"));
            workspace_switch = new Granite.SwitchModelButton ("Workspace number");
            workspace_switch.set_active (settings.get_boolean ("show-workspace"));
            indicator = new Granite.SwitchModelButton ("Show indicator");
            indicator.set_active (settings.get_boolean ("display-indicator"));

            settings.bind ("display-indicator", indicator, "active", SettingsBindFlags.DEFAULT);

            settings.bind ("icon-only", icon_only_switch, "active", SettingsBindFlags.DEFAULT);
            settings.bind ("show-cpu", cpu_switch, "active", SettingsBindFlags.DEFAULT);
            settings.bind ("show-cpu-temp", cpu_temp_switch, "active", SettingsBindFlags.DEFAULT);
            settings.bind ("show-ram", ram_switch, "active", SettingsBindFlags.DEFAULT);
            settings.bind ("show-network", network_switch, "active", SettingsBindFlags.DEFAULT);
            settings.bind ("show-disk", disk_switch, "active", SettingsBindFlags.DEFAULT);
            settings.bind ("show-workspace", workspace_switch, "active", SettingsBindFlags.DEFAULT);

            settings.bind ("icon-only", settings_separator, "visible", SettingsBindFlags.INVERT_BOOLEAN);
            settings.bind ("icon-only", cpu_switch, "visible", SettingsBindFlags.INVERT_BOOLEAN);
            settings.bind ("icon-only", cpu_temp_switch, "visible", SettingsBindFlags.INVERT_BOOLEAN);
            settings.bind ("icon-only", ram_switch, "visible", SettingsBindFlags.INVERT_BOOLEAN);
            settings.bind ("icon-only", network_switch, "visible", SettingsBindFlags.INVERT_BOOLEAN);
            settings.bind ("icon-only", disk_switch, "visible", SettingsBindFlags.INVERT_BOOLEAN);
            settings.bind ("icon-only", workspace_switch, "visible", SettingsBindFlags.INVERT_BOOLEAN);

            add (indicator);
            add (icon_only_switch);
            add (settings_separator);
            add (cpu_switch);
            add (cpu_temp_switch);
            add (ram_switch);
            add (network_switch);
            add (disk_switch);
            add (workspace_switch);

        }
    }
}
