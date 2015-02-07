class PromptTask
  def initialize(user_ids, worker)
    @user_ids = user_ids
    @worker = worker
  end

  def run
    @user_ids.each do |user_id|
      @worker.new.perform(user_id)
    end
  end
end
