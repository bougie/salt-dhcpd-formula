{% from "dhcpd/default.yml" import lookup with context %}
{% set lookup = salt['grains.filter_by'](lookup, grain='os', merge=salt['pillar.get']('dhcpd:lookup')) %}

{% if lookup.package is defined %}
dhcpd_package:
    pkg.installed:
        - name: {{lookup.package}}
{% endif %}
