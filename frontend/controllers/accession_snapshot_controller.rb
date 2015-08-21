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

    ##Render json inline (for testing)
    #render :json => accession.to_json
    deliver_as_download(accession)
  end


  private

  def deliver_as_download(accession)
    send_data accession.to_json,
              :filename => generate_filename(accession),
              :type => 'application/json',
              :disposition => 'attachment'
  end

  def generate_filename(accession)
    now = Time.now.strftime("%Y%m%d%H%M%S")
    "repositories_#{session[:repo_id]}_accessions_#{params[:id]}.#{now}.json"
  end

  def find_opts
    opts = super
    opts["resolve[]"] << "authorizer"
    opts["resolve[]"] << "top_container::container_profile"

    opts
  end
end