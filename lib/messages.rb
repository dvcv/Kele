module Messages
  def get_messages(page)
    JSON.parse("#{self.class.get("/message_threads", headers: { "authorization" => self.auth_token }, body: {"page" => page})}")
  end
  def create_message(sender, recipient_id, subject, stripped_text)
    values = {
      "sender" => sender,
      "recipient_id" => recipient_id,
      "subject" => subject,
      "stripped-text" => stripped_text
    }
    self.class.post("/messages", headers: { "authorization" => self.auth_token }, body: values)
  end
end
