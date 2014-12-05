require 'rails_helper'

describe ClubsController do

  describe '#index' do

    it 'redirects visitors to login path' do
      get :index
      expect(response).to redirect_to(login_path)
    end

    it 'render index when logged in student tries visits' do
      student = Student.create!(
        name: "Rudy",
        email: "rudy@example.com",
        password: "password",
      )
      session[:student_id] = student.id
      get :index
      expect(response).to render_template("index")
    end

  end

end
