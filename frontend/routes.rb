ArchivesSpace::Application.routes.draw do
  match('/plugins/accessions/:id/snapshot' => 'accession_snapshot#download', :via => [:get])
end
