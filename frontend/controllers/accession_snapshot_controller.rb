class AccessionSnapshotController < ApplicationController
  set_access_control  "view_repository" => [:download]

  def download
    accession = Accession.find(params[:id], find_opts)

    if accession['classifications']
      accession['classifications'].each do |classification|
        next unless classification['_resolved']
        resolved = classification["_resolved"]
        resolved['title'] = ClassificationHelper.format_classification(resolved['path_from_root'])
      end
    end

    render :json => accession.to_json
  end
end