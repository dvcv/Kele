module Roadmap
  def get_roadmap(roadmap_id)
    JSON.parse("#{self.class.get("/roadmaps/#{roadmap_id}", headers: { "authorization" => self.auth_token })}")
  end

  def get_checkpoint(checkpoint_id)
    JSON.parse("#{self.class.get("/checkpoints/#{checkpoint_id}", headers: { "authorization" => self.auth_token })}")
  end
end
