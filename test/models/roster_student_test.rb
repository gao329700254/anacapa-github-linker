require 'test_helper'

class RosterStudentTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @course = courses(:course1)
    @user = users(:wes)
    @user.add_role(:admin)
    sign_in @user

    @ta_user = User.create!(
      name: 'Chris',
      username: 'cgaucho',
      uid: 1234567,
      provider: 'GitHub',
      email: 'cgaucho@example.edu',
      password: 'a9sd8ua98fu9as'
    )
    @ta_roster_student = RosterStudent.create!(
      perm: 1234,
      first_name: 'Chris',
      last_name: 'Gaucho',
      email: 'cgaucho@example.edu',
      course: @course,
      enrolled: false,
      user: @ta_user
    )
    @ta_user.add_role :ta, @course

  end

  test "TA should have status TA" do
    assert_equal "TA", @ta_roster_student.status
  end

  

end
