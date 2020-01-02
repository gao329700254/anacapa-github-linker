class AddShortNameToCompletedJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :completed_jobs, :job_short_name, :string
  end
end
