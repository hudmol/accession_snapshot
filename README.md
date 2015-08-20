# accession_snapshot
An ArchivesSpace plugin that adds the ability to download a JSON snapshot of an Accession from the frontend UI.

## How to install it

To install, just activate the plugin in your config/config.rb file by
including an entry such as:

     # If you have other plugins loaded, just add 'accession_snapshot' to
     # the list
     AppConfig[:plugins] = ['local', 'other_plugins', 'accession_snapshot']

And then clone the `accession_snapshot` repository into your
ArchivesSpace plugins directory.  For example:

     cd /path/to/your/archivesspace/plugins
     git clone https://github.com/hudmol/accession_snapshot.git

## How it works

This plugin inserts a "Download Snapshot" button to an Accession record's toolbar.  When clicked,
Accession record JSON is provided as a download.  This JSON contains the full representation of the
Accession including sub-records and the details of "first-degree" related records.
