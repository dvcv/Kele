module Submission
  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id)
    values = {
    "checkpoint_id" => checkpoint_id,
    "assignment_branch" => assignment_branch,
    "assignment_commit_link" => assignment_commit_link,
    "comment" => comment,
    "enrollment_id" => enrollment_id
    }
    self.class.post("/checkpoint_submissions", headers: { "authorization" => self.auth_token }, body: values)
  end
end
