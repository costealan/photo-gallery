class GalleryPhotos
  def initialize(id)
    @id = id
  end

  def get_photos
    conn = Faraday.new(
            url: "https://api.pexels.com/v1/collections/#{@id}",
            params: { param: "1" },
            headers: { "Content-Type" => "application/json",
                        "Authorization" => Rails.application.credentials.dig(:pexels, :access_key) }
            )
    response = conn.get
    body = JSON.parse(response.body)
    body["media"]
  end
end
