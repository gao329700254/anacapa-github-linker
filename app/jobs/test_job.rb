class TestJob
  include SuckerPunch::Job

  def perform(url_triggered_from, course_id)
    CompletedJob.create(job_name: "Test Job", url_triggered_from: url_triggered_from,
                        course_id: course_id)
    if CompletedJob.where('course_id = ' + course_id.to_s).count > 10
      CompletedJob.where('course_id = ' + course_id.to_s).order(:created_at).first.destroy
    end
  end
end
